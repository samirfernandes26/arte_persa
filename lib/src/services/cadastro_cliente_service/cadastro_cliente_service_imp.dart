import 'dart:convert';
import 'dart:developer';

import 'package:arte_persa/src/repositories/convert_addresses/convert_addresses_repository_impl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/services/cadastro_cliente_service/cadastro_cliente_service.dart';

class CadastroClienteServiceImp extends CadastroClienteService {
  @override
  Future<Either<ServiceException, ClienteModel>> execute({
    required ClienteModel cliente,
  }) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      final convertAddressesRepository = ConvertAddressesRepositoryImpl();
      final sharedPreferences = await SharedPreferences.getInstance();
      final collection = fireStore.collection('clientes');
      final restUser = sharedPreferences.getString(LocalStorageKeys.userInfo);
      final user = json.decode(restUser!);

      final enderecoCompleto =
          '${cliente.endereco?.logradouro}, ${cliente.endereco?.numero}, ${cliente.endereco?.bairro}, ${cliente.endereco?.estado}, ${cliente.endereco?.cep}, brasil';

      final coordenasRest =
          await convertAddressesRepository.convertAddressesToGeolocation(
        endereco: enderecoCompleto,
      );

      DocumentReference clienteRef = await collection.add(
        {
          'id': null,
          'tipo_cliente': cliente.tipoCliente,
          'retem_iss': cliente.retemIss,
          'nome': cliente.nome,
          'sobre_nome': cliente.sobreNome,
          'razao_social': cliente.razaoSocial,
          'cpf': cliente.cpf,
          'cnpj': cliente.cnpj,
          'data_nascimento': cliente.dataNascimento,
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
          message: 'Não foi possível cadastrar o cliente',
        ),
      );
    }
  }
}
