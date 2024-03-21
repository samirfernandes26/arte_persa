import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/ordem_de_servico_model.dart';

abstract class OrdemDeServicoService {
  Future<Either<ServiceException, OrdemDeServicoModel>> execute(
    OrdemDeServicoModel ordeDeServico,
  );
}
