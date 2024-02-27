import 'package:arte_persa/src/model/servico_model.dart';

enum OrdemDeServicoStateStatus {
  initial,
  loaded,
  success,
  error,
}


class OrdemDeServicoState {

  OrdemDeServicoState.initial() : this(
    status: OrdemDeServicoStateStatus.initial,
    servicos: [],
  );

  OrdemDeServicoState({
    required this.status,
    this.servicos,
    this.message,
    this.loading,
  });
 

  OrdemDeServicoStateStatus status;
  List<ServicoModel>? servicos;
  String? message;
  bool? loading;

  OrdemDeServicoState copyWith({
    OrdemDeServicoStateStatus? status,
    List<ServicoModel>? servicos,
    String? message,
    bool? loading,

  }) => OrdemDeServicoState(
    status: status ?? this.status,
    servicos: servicos ?? this.servicos,
    message: message ?? this.message,
    loading: loading ?? this.loading,
  );
}
