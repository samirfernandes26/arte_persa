import 'package:arte_persa/src/model/cliente_pj_model.dart';

enum CadastroPjStatus {
  initial,
  loaded,
  success,
  error,
}

class CadastroPjState {
  CadastroPjState({
    required this.status,
    required this.telefoneContatoUmWhatsapp,
    required this.telefoneContatoDoisWhatsapp,
    this.message,
    this.cliente,
  });

  CadastroPjState.initial()
      : this(
          status: CadastroPjStatus.initial,
          telefoneContatoUmWhatsapp: false,
          telefoneContatoDoisWhatsapp: false,
        );

  CadastroPjStatus status;
  String? message;
  ClientePjModel? cliente;
  bool telefoneContatoUmWhatsapp;
  bool telefoneContatoDoisWhatsapp;

  CadastroPjState copyWith({
    CadastroPjStatus? status,
    String? message,
    ClientePjModel? cliente,
    bool? telefoneContatoUmWhatsapp,
    bool? telefoneContatoDoisWhatsapp,
  }) {
    return CadastroPjState(
      status: status ?? this.status,
      message: message ?? this.message,
      cliente: cliente ?? this.cliente,
      telefoneContatoUmWhatsapp:
          telefoneContatoUmWhatsapp ?? this.telefoneContatoUmWhatsapp,
      telefoneContatoDoisWhatsapp:
          telefoneContatoDoisWhatsapp ?? this.telefoneContatoDoisWhatsapp,
    );
  }
}
