import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cadastro_model.dart';

abstract class CadastroService {
  Future<Either<ServiceException, CadastroModel>> execute(Map<String, dynamic> data);
}