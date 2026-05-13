import 'package:arte_persa/src/core/fp/fp.dart';

abstract interface class SeedsItem {
  Future<Either<SeedExcepection, Nil>> handler();
}

abstract class BaseSeeder with SeederMixin implements SeedsItem {}
