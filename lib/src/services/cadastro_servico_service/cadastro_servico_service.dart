import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cadastro_servico_model.dart';

abstract class CadastroServicoService {
  Future<Either<ServiceException, CadastroServicoModel>> execute(Map<String, dynamic> data);
}