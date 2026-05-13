import 'package:fp/fp.dart';

abstract interface class LoginService {
  Future<Either<ServiceException, Nil>> execute(Map<String, dynamic> data);
}
