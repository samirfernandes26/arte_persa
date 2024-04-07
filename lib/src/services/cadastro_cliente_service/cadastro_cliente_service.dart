import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cliente_model.dart';

abstract class CadastroClienteService {
  Future<Either<ServiceException, ClienteModel>> execute({
    required ClienteModel cliente,
  });
}
