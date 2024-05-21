import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cliente_pj_model.dart';

abstract class CadastroClientePjService {
  Future<Either<ServiceException, ClientePjModel>> execute({
    required ClientePjModel cliente,
  });
}
