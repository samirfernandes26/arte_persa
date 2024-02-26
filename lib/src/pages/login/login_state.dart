import 'package:arte_persa/src/model/usuario_model.dart';

enum LoginStateStatus {
  initial,
  error,
  success,
  loaded,
}

class LoginState {
  final LoginStateStatus status;
  final String? errorMessage;
  final String? message;
  final UsuarioModel? usuario;

  LoginState.initial() : this(status: LoginStateStatus.initial);

  LoginState({
    required this.status,
    this.errorMessage,
    this.message,
    this.usuario,
  });

  LoginState copyWith(
      {LoginStateStatus? status,
      String? errorMessage,
      String? message,
      UsuarioModel? usuario}) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      usuario: usuario ?? this.usuario,
    );
  }
}
