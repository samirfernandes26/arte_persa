import 'dart:async';
import 'dart:convert';

import 'package:form_builder_custom/form_builder_custom.dart';
import 'package:fp/fp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'autenticacao_screen_vm.g.dart';

@Riverpod()
class AutenticacaoScreenVm extends _$AutenticacaoScreenVm {
  @override
  AutenticacaoScreenState build() => AutenticacaoScreenState.initial();

  List<Map<String, dynamic>> municipios = [];

  final _municipiosController = StreamController<List<Option<String>>>();

  Stream<List<Option<String>>> get municipiosStream =>
      _municipiosController.stream;

  Future<void> dispose() async {
    await _municipiosController.close();
  }

  void toogleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  Future<void> handleSignIn(Map<String, dynamic> form) async {
    final response = await ref.read(loginServiceProvider).execute(form);

    switch (response) {
      case Success():
        state = state.copyWith(
          message: 'Usuário logado com sucesso',
          status: AutenticacaoScreenStatus.success,
        );
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          message: message,
          status: AutenticacaoScreenStatus.error,
        );
    }
  }
}
