import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/usuario_model.dart';

abstract class CadastroService {
  Future<Either<ServiceException, UsuarioModel>> execute({
    required Map<String, dynamic> userJson,
  });
}
