import 'package:arte_persa/src/core/fp/fp.dart';

abstract interface class LoginService {
  Future<Either<ServiceException, Nil>> execute(Map<String, dynamic> data);
}
