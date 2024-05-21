import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cliente_pf_model.dart';

abstract class CadastroClientePfService {
  Future<Either<ServiceException, ClientePfModel>> execute({
    required ClientePfModel cliente,
  });
}
