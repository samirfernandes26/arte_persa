import 'package:arte_persa/src/core/exceptions/repository_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';

abstract interface class ConvertAddressesRepository {
  Future<Either<RepositoryException, Map<String, dynamic>>>
      convertAddressesToGeolocation({
    required String endereco,
  });
}
