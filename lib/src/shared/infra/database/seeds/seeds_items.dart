import 'package:fp/fp.dart';

abstract interface class SeedsItem {
  Future<Either<SeedExcepection, Nil>> handler();
}

abstract class BaseSeeder with SeederMixin implements SeedsItem {}
