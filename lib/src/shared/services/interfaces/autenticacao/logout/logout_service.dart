import 'package:fp/fp.dart';

abstract interface class LogoutService {
  Future<Either<ServiceException, Nil>> execute();
}
