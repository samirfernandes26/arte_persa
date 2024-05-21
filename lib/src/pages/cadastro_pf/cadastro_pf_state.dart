import 'package:arte_persa/src/model/cliente_pf_model.dart';

enum CadastroPfStatus {
  initial,
  loaded,
  success,
  error,
}

class CadastroPfState {
  CadastroPfState({
    required this.status,
    required this.telefoneContatoUmWhatsapp,
    required this.telefoneContatoDoisWhatsapp,
    this.message,
    this.cliente,
  });

  CadastroPfState.initial()
      : this(
          status: CadastroPfStatus.initial,
          telefoneContatoUmWhatsapp: false,
          telefoneContatoDoisWhatsapp: false,
        );

  CadastroPfStatus status;
  String? message;
  ClientePfModel? cliente;
  bool telefoneContatoUmWhatsapp;
  bool telefoneContatoDoisWhatsapp;

  CadastroPfState copyWith({
    CadastroPfStatus? status,
    String? message,
    ClientePfModel? cliente,
    bool? telefoneContatoUmWhatsapp,
    bool? telefoneContatoDoisWhatsapp,
  }) {
    return CadastroPfState(
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
