import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_screen_vm.g.dart';

enum SplashState { initial, logged, error }

@riverpod
class SplashScreenVm extends _$SplashScreenVm {
  @override
  Future<SplashState> build() async {
    try {
      await ref.read(getMeProvider.future);

      await getFirebaseRemoteConfigs();

      return SplashState.logged;
    } catch (e) {
      log('SplashScreenVm:build', error: e);
      return SplashState.error;
    }
  }

  Future<void> getFirebaseRemoteConfigs() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setDefaults(RemoteConfigs.defaultValues);

    await remoteConfig.fetchAndActivate();
  }
}
