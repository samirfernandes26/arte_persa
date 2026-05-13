import 'package:fp/fp.dart';

abstract interface class SeedsHandler {
  Future<Either<SeedExcepection, Nil>> execute();
}
