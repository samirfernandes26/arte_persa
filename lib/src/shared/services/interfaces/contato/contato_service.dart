import 'package:fp/fp.dart';

abstract interface class ContatoService {
  Future<Either<ServiceException, Nil>> excute(int id, ContatoModel data);
}

abstract class ContatoDomicilioService implements ContatoService {}

abstract class ContatoIndividualService implements ContatoService {}
