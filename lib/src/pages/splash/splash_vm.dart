import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'splash_vm.g.dart';

enum SplashState {
  initial,
  login,
  logged,
  unlogged,
  error,
}

@riverpod
class SplashVm extends _$SplashVm {
  @override
  Future<SplashState> build() async {
    try {
      FirebaseAuth fireStore = FirebaseAuth.instance;
      final rest = await fireStore.currentUser;

      if(rest != null) {
        return SplashState.logged;
      }else{
        return SplashState.unlogged;
      }

    } catch (e) {
      log('Error ao obter as informações do usuário', error: e);
      return SplashState.error;
    }
  }
}
