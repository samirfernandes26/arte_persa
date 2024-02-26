import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:arte_persa/src/model/usuario_model.dart';

enum CadastroClienteStateStatus {
  initial,
  loaded,
  success,
  error,
}

class CadastroClienteState {
  CadastroClienteState({
    required this.status,
    this.clienteForm,
    this.enderecoForm,
    this.message,
    this.usuario,
  });

  CadastroClienteState.initial()
      : this(
          status: CadastroClienteStateStatus.initial,
        );

  CadastroClienteStateStatus status;
  ClienteModel? clienteForm;
  EnderecoModel? enderecoForm;
  String? message;
  UsuarioModel? usuario;

  CadastroClienteState copyWith({
    CadastroClienteStateStatus? status,
    ClienteModel? clienteForm,
    EnderecoModel? enderecoForm,
    String? message,
    UsuarioModel? usuario,
  }) =>
      CadastroClienteState(
        status: status ?? this.status,
        clienteForm: clienteForm ?? this.clienteForm,
        enderecoForm: enderecoForm ?? this.enderecoForm,
        message: message ?? this.message,
        usuario: usuario ?? this.usuario,
      );
}
