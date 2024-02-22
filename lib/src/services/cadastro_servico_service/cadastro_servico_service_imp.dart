import 'dart:developer';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cadastro_servico_model.dart';
import 'package:arte_persa/src/services/cadastro_servico_service/cadastro_servico_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroServicoServiceImp extends CadastroServicoService {
  @override
  Future<Either<ServiceException, CadastroServicoModel>> execute(Map<String, dynamic> data) {
    // TODO: implement execute
    throw UnimplementedError();
  }

}
