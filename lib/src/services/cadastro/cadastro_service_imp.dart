import 'dart:developer';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/services/cadastro/cadastro_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroServiceImp implements CadastroService {
  @override
  Future<Either<ServiceException, UsuarioModel>> execute(
      Map<String, dynamic> data) async {
    // Sua lógica para executar o serviço aqui
    try {
      Map<String, dynamic> form = Map.from(data);
      UsuarioModel usuario = UsuarioModel.fromJson(form);

      final rest = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha!,
      );

      rest.user?.updateDisplayName(usuario.nome);
      usuario.id = rest.user?.uid;

      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      fireStore.collection('usuarios').doc(usuario.id).set({...data, 'id': rest.user?.uid, 'senha': null});

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
