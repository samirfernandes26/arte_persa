import 'package:arte_persa/src/core/fp/fp.dart';

abstract interface class CarregarArquivoService {
  Future<Either<ServiceException, String?>> execute();
}
