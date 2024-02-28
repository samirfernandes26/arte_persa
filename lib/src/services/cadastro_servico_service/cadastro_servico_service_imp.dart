import 'dart:convert';
import 'dart:developer';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/services/cadastro_servico_service/cadastro_servico_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroServicoServiceImp extends CadastroServicoService {
  @override
  Future<Either<ServiceException, ServicoModel>> execute(
    Map<String, dynamic> servico,
  ) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final sharedPreferences = await SharedPreferences.getInstance();
      final collection = fireStore.collection('servicos');
      final restUser = sharedPreferences.getString(LocalStorageKeys.userInfo);
      final user = json.decode(restUser!);

      final clienteRef = await collection.add({...servico, 'user_id': user['id']});
      await collection.doc(clienteRef.id).update({'id':clienteRef.id});

      ServicoModel servicoForm = ServicoModel.fromJson({...servico, 'user_id': user['id'], 'id': clienteRef.id});

      return Success(servicoForm);
    } on Exception catch (e) {
      log('Erro ao cadastrar Servico', error: e);

      return Failure(
        ServiceException(
          message: 'Não foi possível cadastrar o serviço',
        ),
      );
    }
  }
}
