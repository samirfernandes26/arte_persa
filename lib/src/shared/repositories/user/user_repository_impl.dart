import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<RepositoryException, UserModel>> me() async {
    try {
      final sp = await SharedPreferences.getInstance();

      final userInfoJson = sp.getString(LocalStorageKeys.userInfo);

      if (userInfoJson == null) {
        throw Exception("$LocalStorageKeys.userInfo não encontrado");
      }

      final userJson = json.decode(userInfoJson);

      final userModel = UserModel.fromJson(userJson);

      return Success(userModel);
    } on Exception catch (e) {
      log('UserRepository', error: e);
      return Failure(
        RepositoryException(
          message: 'Não foi possível obter informações do usuário',
        ),
      );
    }
  }
}
