import 'dart:convert';
import 'dart:developer';

import 'package:device_client_information/device_client_information.dart';
import 'package:arte_persa/src/core/fp/fp.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginServiceImpl implements LoginService {
  LoginServiceImpl({required this.autenticacaoRepository});

  AutenticacaoRepository autenticacaoRepository;

  @override
  Future<Either<ServiceException, Nil>> execute(
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await autenticacaoRepository.login(data);

      if (response.left is AuthException) {
        throw response.left;
      }

      final sp = await SharedPreferences.getInstance();

      final instanciasString =
          sp.getString(LocalStorageKeys.instanciaInfo) as String;

      final deviceInfo = await DeviceClientInformation.getInformation();

      final localidadeId = (json
          .decode(instanciasString)
          .where((instancia) => instancia['id'] == data['instancia'])
          .first)['localidade_id'];

      final municipioKey = (json
          .decode(instanciasString)
          .where((instancia) => instancia['id'] == data['instancia'])
          .first)['id'];

      Map<String, dynamic> userInfoJson = {
        ...response.right.toJson(),
        'device_uuid': deviceInfo.deviceId,
        'instancia_id': data['instancia'],
        'localidade_id': localidadeId,
        'municipio_key': municipioKey,
      };

      await Future.wait([
        sp.setString(LocalStorageKeys.userInfo, json.encode(userInfoJson)),
        sp.setString(LocalStorageKeys.accessToken, userInfoJson['token']),
      ]);

      return Success(nil);
    } on AuthException catch (e, s) {
      log('LoginServiceImpl:execute', error: e, stackTrace: s);

      return Failure(ServiceException(message: e.message));
    } on Exception catch (e, s) {
      log('LoginServiceImpl:execute', error: e, stackTrace: s);

      return Failure(
        ServiceException(
          message: 'Erro ao tentar realizar a autenticação do usuário',
        ),
      );
    }
  }
}
