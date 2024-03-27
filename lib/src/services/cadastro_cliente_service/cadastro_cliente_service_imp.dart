import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/services/cadastro_cliente_service/cadastro_cliente_service.dart';

class CadastroClienteServiceImp extends CadastroClienteService {
  @override
  Future<Either<ServiceException, ClienteModel>> execute(
    Map<String, dynamic> cliente,
    Map<String, dynamic> endereco,
  ) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final sharedPreferences = await SharedPreferences.getInstance();
      final collection = fireStore.collection('clientes');
      final restUser = sharedPreferences.getString(LocalStorageKeys.userInfo);
      final user = json.decode(restUser!);

      final clienteRef = await collection.add(
        {
          ...cliente,
          'userId': user['id'],
        },
      );

      await collection.doc(clienteRef.id).update(
        {
          'id': clienteRef.id,
        },
      );

      await clienteRef.collection('enderecos').add(
        {
          ...endereco,
          'userId': user['id'],
        },
      );

      ClienteModel clienteSalvo = ClienteModel.fromJson(cliente);

      return Success(clienteSalvo);
    } on Exception catch (e) {
      log(
        'Erro ao cadastrar cliente',
        error: e,
      );

      return Failure(
        ServiceException(
          message: 'Não foi possível cadastrar o cliente',
        ),
      );
    }
  }
}
