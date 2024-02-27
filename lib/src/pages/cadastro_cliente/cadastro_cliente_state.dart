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
    this.clienteJson,
    this.enderecoForm,
    this.enderecoJson,
    this.message,
    this.usuario,
  });

  CadastroClienteState.initial()
      : this(
          status: CadastroClienteStateStatus.initial,
        );

  CadastroClienteStateStatus status;
  ClienteModel? clienteForm;
  Map<String, dynamic>? clienteJson;
  EnderecoModel? enderecoForm;
  Map<String, dynamic>? enderecoJson;
  String? message;
  UsuarioModel? usuario;

  CadastroClienteState copyWith({
    CadastroClienteStateStatus? status,
    ClienteModel? clienteForm,
    Map<String,dynamic>? clienteJson,
    EnderecoModel? enderecoForm,
    Map<String,dynamic>? enderecoJson,
    String? message,
    UsuarioModel? usuario,
  }) =>
      CadastroClienteState(
        status: status ?? this.status,
        clienteForm: clienteForm ?? this.clienteForm,
        clienteJson: clienteJson ?? this.clienteJson,
        enderecoForm: enderecoForm ?? this.enderecoForm,
        enderecoJson: enderecoJson ?? this.enderecoJson,
        message: message ?? this.message,
        usuario: usuario ?? this.usuario,
      );
}
