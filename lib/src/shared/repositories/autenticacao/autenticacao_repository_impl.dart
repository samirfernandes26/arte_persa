import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutenticacaoRepositoryImpl implements AutenticacaoRepository {
  AutenticacaoRepositoryImpl(this.restClient);

  RestClient restClient;

  @override
  Future<Either<AuthException, UserModel>> login(
    Map<String, dynamic> authData,
  ) async {
    try {
      final sp = await SharedPreferences.getInstance();

      List<dynamic> instancias = json.decode(
        sp.getString(LocalStorageKeys.instanciaInfo) ?? '[]',
      );

      if (instancias.isEmpty) {
        throw ServiceException(message: 'Instâncias não carregadas.');
      }

      Map<String, dynamic> instanciaLogada = instancias
          .where((instancia) => instancia['id'] == authData['instancia'])
          .first;

      restClient.options.baseUrl = instanciaLogada['url'];

      final Response(:data) = await restClient.unAuth
          .post<Map<String, dynamic>>(
            ApiKeys.postLoginUri,
            data: {'login': authData['usuario'], 'password': authData['senha']},
          );

      return Success(
        UserModel.fromJson({
          ...data!,
          'localidade_id': instanciaLogada['localidade_id'],
        }),
      );
    } on DioException catch (e, s) {
      log('AutenticacaoRepositoryImpl:login', error: e, stackTrace: s);

      if (e.response != null) {
        final Response(:data, :statusCode) = e.response!;

        return Failure(switch (statusCode) {
          HttpStatus.unauthorized => AuthError(message: data['error']),
          HttpStatus.forbidden => AuthError(message: 'Usuário não autorizado'),
          HttpStatus.internalServerError => AuthError(
            message: 'Erro interno do servidor',
          ),
          (_) => AuthError(
            message:
                data['error'] ??
                data['msg'] ??
                'Erro ao tentar realizar a autenticação',
          ),
        });
      }

      return Failure(
        AuthError(message: 'Erro ao tentar realizar a autenticação'),
      );
    } on Exception catch (e, s) {
      log('AutenticacaoRepositoryImpl:login', error: e, stackTrace: s);

      return Failure(
        AuthError(message: 'Erro ao tentar realizar a autenticação'),
      );
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> logout() async {
    try {
      final Response() = await restClient.auth.post<Map<String, dynamic>>(
        ApiKeys.postLogoutUri,
      );

      return Success(nil);
    } on DioException catch (e, s) {
      log('AutenticacaoRepositoryImpl:login', error: e, stackTrace: s);

      if (e.response != null) {
        final Response(:data, :statusCode) = e.response!;

        return Failure(switch (statusCode) {
          HttpStatus.unauthorized => RepositoryException(
            message: data['error'],
          ),
          HttpStatus.forbidden => RepositoryException(
            message: 'Erro ao tentar realizar o logout',
          ),
          HttpStatus.internalServerError => RepositoryException(
            message: 'Erro ao tentar realizar o logout',
          ),
          (_) => RepositoryException(
            message:
                data['error'] ??
                data['msg'] ??
                'Erro ao tentar realizar o logout',
          ),
        });
      }

      return Failure(
        RepositoryException(message: 'Erro ao tentar realizar o logout'),
      );
    } on Exception catch (e, s) {
      log('AutenticacaoRepositoryImpl:login', error: e, stackTrace: s);

      return Failure(
        RepositoryException(message: 'Erro ao tentar realizar o logout'),
      );
    }
  }
}
