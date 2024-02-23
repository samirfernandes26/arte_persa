import 'package:arte_persa/src/model/servico_model.dart';
import 'package:arte_persa/src/model/cadastro_model.dart';

enum ServicosStateStatus {
  initial,
  loaded,
  success,
  error,
}

class ServicosState {
  ServicosState.initial()
      : this(
          status: ServicosStateStatus.initial,
          servicos: [],
        );

  ServicosState({
    required this.status,
    this.servicos,
    this.message,
    this.usuario,
    this.loading,
  });

  ServicosStateStatus status;
  List<ServicoModel>? servicos;
  String? message;
  CadastroModel? usuario;
  bool? loading;

  ServicosState copyWith({
    ServicosStateStatus? status,
    List<ServicoModel>? servicos,
    String? message,
    CadastroModel? usuario,
    bool? loading,
  }) =>
      ServicosState(
        status: status ?? this.status,
        loading: loading ?? this.loading,
        servicos: servicos ?? this.servicos,
        message: message ?? this.message,
        usuario: usuario ?? this.usuario,
      );
}
