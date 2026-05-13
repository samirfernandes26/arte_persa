import 'package:arte_persa/src/core/fp/fp.dart';

abstract interface class ContatoService {
  Future<Either<ServiceException, Nil>> excute(int id, ContatoModel data);
}

abstract class ContatoDomicilioService implements ContatoService {}

abstract class ContatoIndividualService implements ContatoService {}
