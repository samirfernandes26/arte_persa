import 'package:arte_persa/src/model/cliente_model.dart';

enum VisualizarClienteStateStatus {
  initial,
  loaded,
  success,
  error,
}

class VisualizarClienteState {
  VisualizarClienteState({
    required this.status,
    this.message,
    this.cliente,
  });

  VisualizarClienteState.initial()
      : this(
          status: VisualizarClienteStateStatus.initial,
        );

  VisualizarClienteStateStatus status;
  String? message;
  ClienteModel? cliente;

  VisualizarClienteState copyWith({
    VisualizarClienteStateStatus? status,
    String? message,
    ClienteModel? cliente,
  }) =>
      VisualizarClienteState(
        status: status ?? this.status,
        message: message ?? this.message,
        cliente: cliente ?? this.cliente,
      );
}
