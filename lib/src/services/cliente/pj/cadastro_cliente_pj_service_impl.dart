import 'dart:convert';
import 'dart:developer';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cliente_pj_model.dart';
import 'package:arte_persa/src/repositories/convert_addresses/convert_addresses_repository_impl.dart';
import 'package:arte_persa/src/services/interfaces/cliente/pj/cadastro_cliente_pj_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroClientePjServiceImpl extends CadastroClientePjService {
  @override
  Future<Either<ServiceException, ClientePjModel>> execute({
    required ClientePjModel cliente,
  }) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      ConvertAddressesRepositoryImpl convertAddresses =
          ConvertAddressesRepositoryImpl();

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      CollectionReference<Map<String, dynamic>> collection =
          fireStore.collection(
        'clientes_pj',
      );

      String? restUser = sharedPreferences.getString(
        LocalStorageKeys.userInfo,
      );

      dynamic user = json.decode(restUser!);

      String enderecoCompleto =
          '${cliente.endereco?.logradouro}, ${cliente.endereco?.numero}, ${cliente.endereco?.bairro}, ${cliente.endereco?.estado}, ${cliente.endereco?.cep}, brasil';

      Map<String, dynamic> coordenasRest =
          await convertAddresses.convertAddressesToGeolocation(
        endereco: enderecoCompleto,
      );

      DocumentReference clienteRef = await collection.add(
        {
          'id': null,
          'cnpj': cliente.cnpj,
          'retem_iss': cliente.retemIss,
          'por_quem_procurar': cliente.porQuemProcurar,
          'telefone_contato_um': cliente.telefoneContatoUm,
          'telefone_contato_um_Whatsapp': cliente.telefoneContatoUmWhatsapp,
          'telefone_contato_dois': cliente.telefoneContatoDois,
          'telefone_contato_dois_Whatsapp': cliente.telefoneContatoDoisWhatsapp,
          'email': cliente.email,
          'user_id': user['id'],
          'media_da_avaliacao': cliente.mediaDaAvaliacao,
        },
      );

      await collection.doc(clienteRef.id).update(
        {
          'id': clienteRef.id,
        },
      );

      DocumentReference enderecoRef =
          await clienteRef.collection('enderecos').add(
        {
          'id': null,
          'user_id': user['id'],
          'cep': cliente.endereco?.cep,
          'logradouro': cliente.endereco?.logradouro,
          'numero': cliente.endereco?.numero,
          'complemento': cliente.endereco?.complemento,
          'bairro': cliente.endereco?.bairro,
          'estado': cliente.endereco?.estado,
          'referencia': cliente.endereco?.referencia,
          'latitude': coordenasRest["latitude"],
          'longitude': coordenasRest["longitude"],
        },
      );

      await enderecoRef.update(
        {
          'id': enderecoRef.id,
        },
      );

      return Success(cliente);
    } on Exception catch (e) {
      log(
        'Erro ao cadastrar cliente',
        error: e,
      );

      return Failure(
        ServiceException(
          message: 'Não foi possível cadastrar o cliente PJ',
        ),
      );
    }
  }
}
