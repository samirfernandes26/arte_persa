import 'package:fp/fp.dart';

abstract interface class RegisterArquivoService {
  Future<Either<ServiceException, Arquivo>> execute({
    required ArquivoModel data,
  });
}
