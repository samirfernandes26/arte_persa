import 'dart:convert';
import 'dart:developer';

import 'package:arte_persa/src/core/constants/local_storage_keys.dart';
import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/cadastro_model.dart';
import 'package:arte_persa/src/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImpl implements AuthService {
  @override
  Future<Either<ServiceException, CadastroModel>> execute(
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

      sharedPreferences.setString(LocalStorageKeys.userInfo, json.encode(user));

      return Success(CadastroModel.fromJson(user!));
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


