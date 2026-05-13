import 'package:arte_persa/src/core/fp/fp.dart';

abstract interface class SeedsHandler {
  Future<Either<SeedExcepection, Nil>> execute();
}
