import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/observacao_model.dart';
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
    this.clientes,
    this.observacoes,
    this.message,
    this.loading,
    this.paginaUm,
    this.paginaDois,
    this.paginatres,
    this.paginaquatro,
  });
 

  OrdemDeServicoStateStatus status;
  List<ServicoModel>? servicos;
  List<ClienteModel>? clientes;
  List<ObservacaoModel>? observacoes;
  Map<String,dynamic>? paginaUm;
  Map<String,dynamic>? paginaDois;
  Map<String,dynamic>? paginatres;
  Map<String,dynamic>? paginaquatro;

  String? message;
  bool? loading;

  OrdemDeServicoState copyWith({
    OrdemDeServicoStateStatus? status,
    List<ServicoModel>? servicos,
    List<ClienteModel>? clientes,
    List<ObservacaoModel>? observacoes,
    String? message,
    bool? loading,
    Map<String,dynamic>? paginaUm,
    Map<String,dynamic>? paginaDois,
    Map<String,dynamic>? paginatres,
    Map<String,dynamic>? paginaquatro,

  }) => OrdemDeServicoState(
    status: status ?? this.status,
    servicos: servicos ?? this.servicos,
    clientes: clientes ?? this.clientes,
    observacoes: observacoes ?? this.observacoes,
    message: message ?? this.message,
    loading: loading ?? this.loading,
    paginaUm: paginaUm ?? this.paginaUm,
    paginaDois: paginaDois ?? this.paginaDois,
    paginatres: paginatres ?? this.paginatres,
    paginaquatro: paginaquatro ?? this.paginaquatro,
  );
}
