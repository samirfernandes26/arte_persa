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
    required this.radioPF,
    required this.radioPJ,
  });

  CadastroClienteState.initial()
      : this(
          status: CadastroClienteStateStatus.initial,
          radioPF: true,
          radioPJ: false,
        );

  CadastroClienteStateStatus status;
  ClienteModel? clienteForm;
  Map<String, dynamic>? clienteJson;
  EnderecoModel? enderecoForm;
  Map<String, dynamic>? enderecoJson;
  String? message;
  UsuarioModel? usuario;
  bool radioPF;
  bool radioPJ;

  CadastroClienteState copyWith({
    CadastroClienteStateStatus? status,
    ClienteModel? clienteForm,
    Map<String,dynamic>? clienteJson,
    EnderecoModel? enderecoForm,
    Map<String,dynamic>? enderecoJson,
    String? message,
    UsuarioModel? usuario,
    bool? radioPF,
    bool? radioPJ,
  }) =>
      CadastroClienteState(
        status: status ?? this.status,
        clienteForm: clienteForm ?? this.clienteForm,
        clienteJson: clienteJson ?? this.clienteJson,
        enderecoForm: enderecoForm ?? this.enderecoForm,
        enderecoJson: enderecoJson ?? this.enderecoJson,
        message: message ?? this.message,
        usuario: usuario ?? this.usuario,
        radioPF: radioPF ?? this.radioPF,
        radioPJ: radioPJ ?? this.radioPJ,
      );
}
