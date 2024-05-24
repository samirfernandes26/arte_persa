import 'dart:developer';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/services/cadastro/cadastro_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroServiceImp implements CadastroService {
  @override
  Future<Either<ServiceException, UsuarioModel>> execute({
    required Map<String, dynamic> userJson,
  }) async {
    try {
      Map<String, dynamic> form = Map.from(userJson);
      UsuarioModel usuario = UsuarioModel.fromJson(form);

      final rest = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha!,
      );

      rest.user?.updateDisplayName(usuario.nome);
      usuario.id = rest.user?.uid;

      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      fireStore.collection('usuarios').doc(usuario.id).set(
        {
          'id': rest.user?.uid,
          'email': usuario.email,
          'senha': null,
          'nome': usuario.nome,
          'sobre_nome': usuario.sobrenome,
          'cpf': usuario.cpf,
          'telefone_contato_um': usuario.telefoneContatoUm,
          'contato_um_whatsapp': usuario.contatoUmWhatsapp,
          'telefone_contato_dois': usuario.telefoneContatoDois,
          'contato_dois_whatsapp': usuario.contatoDoisWhatsapp,
          'data_nascimento': usuario.dataNascimento,
          'created_at': usuario.createdAt,
          'updated_at': usuario.updatedAt,
        },
      );

      return Success(usuario);
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
