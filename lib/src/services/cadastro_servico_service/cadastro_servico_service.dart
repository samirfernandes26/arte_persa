import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/servico_model.dart';

abstract class CadastroServicoService {
  Future<Either<ServiceException, ServicoModel>> execute(Map<String, dynamic> servico);
}