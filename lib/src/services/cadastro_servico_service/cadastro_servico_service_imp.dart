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
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final sharedPreferences = await SharedPreferences.getInstance();
      final collecion = fireStore.collection('servicos');
      final restUser = sharedPreferences.getString(LocalStorageKeys.userInfo);
      final user = json.decode(restUser!);

      collecion.doc().set({...data, 'userId': user['id']});

      CadastroServicoModel cadastroServicoForm = CadastroServicoModel.fromJson({...data, 'userId': user['id']});

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
