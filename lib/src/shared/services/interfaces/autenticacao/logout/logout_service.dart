import 'package:arte_persa/src/core/fp/fp.dart';

abstract interface class LogoutService {
  Future<Either<ServiceException, Nil>> execute();
}
