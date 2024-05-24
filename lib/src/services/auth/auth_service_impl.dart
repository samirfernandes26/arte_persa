import 'dart:convert';
import 'dart:developer';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/usuario_model.dart';
import 'package:arte_persa/src/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<Either<ServiceException, UsuarioModel>> execute(
    String usuario,
    String senha,
  ) async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;

      final rest = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usuario,
        password: senha,
      );

      final user =
          (await fireStore.collection('usuarios').doc(rest.user?.uid).get())
              .data();

      final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
      final sharedPreferences = await SharedPreferences.getInstance();

      String deviceUuid = androidDeviceInfo.serialNumber == 'unknown'
          ? androidDeviceInfo.id
          : androidDeviceInfo.serialNumber;

      sharedPreferences.setString(
        LocalStorageKeys.deviceUuid,
        deviceUuid,
      );

      user!.forEach(
        (key, value) {
          if (value is DateTime) {
            user[key] = value.toIso8601String();
          }
        },
      );

      user['data_nascimento'] = DateFormat('dd/MM/yyyy HH:mm:ss')
          .format((user['data_nascimento'] as Timestamp).toDate())
          .toString();

      user['created_at'] = DateFormat('dd/MM/yyyy HH:mm:ss')
          .format((user['created_at'] as Timestamp).toDate())
          .toString();

      user['updated_at'] = DateFormat('dd/MM/yyyy HH:mm:ss')
          .format((user['updated_at'] as Timestamp).toDate())
          .toString();

      sharedPreferences.setString(LocalStorageKeys.userInfo, jsonEncode(user));

      UsuarioModel userModel = UsuarioModel.fromJson(user);

      return Success(userModel);
    } on Exception catch (e) {
      log('Erro ao logar', error: e);

      return Failure(
        ServiceException(
          message: 'Não foi possível realizar login o usuário',
        ),
      );
    }
  }
}
