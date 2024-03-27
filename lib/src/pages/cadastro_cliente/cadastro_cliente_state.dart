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
    this.enderecoJson,
    this.message,
    this.usuario,
    required this.radioPF,
    required this.radioPJ,
    required this.telefoneContatoUmWhatsapp,
    required this.telefoneContatoDoisWhatsapp,
  });

  CadastroClienteState.initial()
      : this(
          status: CadastroClienteStateStatus.initial,
          radioPF: true,
          radioPJ: false,
          telefoneContatoUmWhatsapp: false,
          telefoneContatoDoisWhatsapp: false,
        );

  CadastroClienteStateStatus status;
  ClienteModel? clienteForm;
  EnderecoModel? enderecoForm;
  Map<String, dynamic>? enderecoJson;
  String? message;
  UsuarioModel? usuario;
  bool radioPF;
  bool radioPJ;
  bool telefoneContatoUmWhatsapp;
  bool telefoneContatoDoisWhatsapp;

  CadastroClienteState copyWith({
    CadastroClienteStateStatus? status,
    ClienteModel? clienteForm,
    EnderecoModel? enderecoForm,
    Map<String, dynamic>? enderecoJson,
    String? message,
    UsuarioModel? usuario,
    bool? radioPF,
    bool? radioPJ,
    bool? telefoneContatoUmWhatsapp,
    bool? telefoneContatoDoisWhatsapp,
  }) =>
      CadastroClienteState(
        status: status ?? this.status,
        clienteForm: clienteForm ?? this.clienteForm,
        enderecoForm: enderecoForm ?? this.enderecoForm,
        enderecoJson: enderecoJson ?? this.enderecoJson,
        message: message ?? this.message,
        usuario: usuario ?? this.usuario,
        radioPF: radioPF ?? this.radioPF,
        radioPJ: radioPJ ?? this.radioPJ,
        telefoneContatoUmWhatsapp:
            telefoneContatoUmWhatsapp ?? this.telefoneContatoUmWhatsapp,
        telefoneContatoDoisWhatsapp:
            telefoneContatoDoisWhatsapp ?? this.telefoneContatoDoisWhatsapp,
      );
}
