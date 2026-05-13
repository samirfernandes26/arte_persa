import 'package:fp/fp.dart';

abstract interface class CarregarArquivoService {
  Future<Either<ServiceException, String?>> execute();
}
