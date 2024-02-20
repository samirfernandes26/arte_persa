import 'dart:developer';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cadastro_model.dart';
import 'package:arte_persa/src/services/cadastro/cadastro_service.dart';

class CadastroServiceImp implements CadastroService {
  @override
  Future<Either<ServiceException, CadastroModel>> execute(Map<String, dynamic> data) async {
    // Sua lógica para executar o serviço aqui
    try {
      Map<String, dynamic> form = Map.from(data);

      CadastroModel usuario = CadastroModel.fromJson(form);

      return Success(usuario);

    }on Exception catch (e) {
      log('Erro ao atualizar o imóvel', error: e);

      return Failure(
        ServiceException(
          message: 'Não foi possível cadastrar o usuário',
        ),
      );
    }
  }
}

