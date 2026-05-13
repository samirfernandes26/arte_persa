import 'package:arte_persa/src/core/fp/fp.dart';

abstract interface class RegisterArquivoService {
  Future<Either<ServiceException, Arquivo>> execute({
    required ArquivoModel data,
  });
}
