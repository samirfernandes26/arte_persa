import 'dart:convert';
import 'dart:developer';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/services/cadastro_cliente_service/cadastro_cliente_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroClienteServiceImp extends CadastroClienteService {
  @override
  Future<Either<ServiceException, ClienteModel>> execute(
      ClienteModel cliente, EnderecoModel endereco) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final sharedPreferences = await SharedPreferences.getInstance();
      final collecion = fireStore.collection('clientes');
      final restUser = sharedPreferences.getString(LocalStorageKeys.userInfo);
      final user = json.decode(restUser!);
      // Atribuir userId ao cliente
      cliente.userId = user['id'];
      // Converter cliente para JSON
      // final clienteJson = json.encode(json.encode(cliente));

      return Success(cliente);
    } on Exception catch (e) {
      log('Erro ao cadastrar cliente', error: e);
      return Failure(
        ServiceException(
          message: 'Não foi possível cadastrar o cliente',
        ),
      );
    }
  }
}
