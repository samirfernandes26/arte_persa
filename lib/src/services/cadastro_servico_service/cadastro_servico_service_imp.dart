import 'dart:convert';
import 'dart:developer';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cadastro_servico_model.dart';
import 'package:arte_persa/src/services/cadastro_servico_service/cadastro_servico_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroServicoServiceImp extends CadastroServicoService {
  @override
  Future<Either<ServiceException, CadastroServicoModel>> execute(
    Map<String, dynamic> data,
  ) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final collecion = fireStore.collection('servicos');
      final restUser = sharedPreferences.get(LocalStorageKeys.userInfo);
      // final user = json.decoder(restUser);
      

      CadastroServicoModel cadastroServicoForm =
          CadastroServicoModel.fromJson(data);

      return Success(cadastroServicoForm);
    } on Exception catch (e) {
      log('Erro ao atualizar o imóvel', error: e);

      return Failure(
        ServiceException(
          message: 'Não foi possível cadastrar o usuário',
        ),
      );
    }
  }
}
