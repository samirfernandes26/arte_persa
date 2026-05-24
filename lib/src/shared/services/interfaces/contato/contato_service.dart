import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:arte_persa/src/shared/models/contato_cliente_model.dart';

abstract interface class ContatoService {
  Future<Either<ServiceException, Nil>> excute(
      int id, ContatoClienteModel data);
}

abstract class ContatoDomicilioService implements ContatoService {}

abstract class ContatoIndividualService implements ContatoService {}
