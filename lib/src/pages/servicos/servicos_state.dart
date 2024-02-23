import 'package:arte_persa/src/model/cadastro_servico_model.dart';
import 'package:arte_persa/src/model/cadastro_model.dart';

enum ServicosStateStatus {
  initial,
  loaded,
  success,
  error,
}

class ServicosState {
  ServicosState({
    required this.status,
    this.servicos,
    this.message,
    this.usuario,
  });

  ServicosState.initial()
      : this(
          status: ServicosStateStatus.initial,
          servicos:[],
        );

  ServicosStateStatus status;
  List<CadastroServicoModel>? servicos;
  String? message;
  CadastroModel? usuario;

  ServicosState copyWith({
    ServicosStateStatus? status,
     List<CadastroServicoModel>? servicos,
    String? message,
    CadastroModel? usuario,
  }) => ServicosState(
    status: status ?? this.status,
    servicos: servicos ?? this.servicos,
    message: message ?? this.message,
    usuario: usuario ?? this.usuario,
  );
}