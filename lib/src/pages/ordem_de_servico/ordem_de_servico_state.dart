import 'package:json_annotation/json_annotation.dart';

import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/faturamento_model.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:arte_persa/src/model/item_model.dart';
import 'package:arte_persa/src/model/observacao_model.dart';
import 'package:arte_persa/src/model/ordem_de_servico_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';

part 'ordem_de_servico_state.g.dart';

enum OrdemDeServicoStateStatus {
  initial,
  loaded,
  success,
  error,
}

class OrdemDeServicoState {
  OrdemDeServicoState.initial()
      : this(
          status: OrdemDeServicoStateStatus.initial,
          servicos: [],
          observacoesModelList: [],
          faturaOs:null,
          image: null,
        );

  OrdemDeServicoState({
    required this.status,
    this.servicos,
    this.clientes,
    this.clienteSelecionando,
    this.message,
    this.loading,
    this.ordemdeServico,
    this.faturaOs,
    this.image,
    this.fotoProduto,
    this.observacao,
    this.itens,
    this.itemForm,
    this.ordemServicioForm,
    this.observacoesModelList,
  });

  OrdemDeServicoStateStatus status;
  OrdemDeServicoModel? ordemdeServico;
  FaturamentoModel? faturaOs;
  List<ItemModel>? itens;
  ClienteModel? clienteSelecionando;

  ObservacaoModel? observacao;
  List<ServicoModel>? servicos;
  List<ClienteModel>? clientes;
  ItemForm? itemForm;
  List<ObservacaoModel>? observacoesModelList;
  ImageModel? image;
  ImageModel? fotoProduto;

  String? message;
  bool? loading;

  OrdemDeServicoForm? ordemServicioForm;

  OrdemDeServicoState copyWith({
    OrdemDeServicoStateStatus? status,
    List<ServicoModel>? servicos,
    List<ClienteModel>? clientes,
    List<ItemModel>? itens,
    ClienteModel? clienteSelecionando,
    OrdemDeServicoForm? ordemServicioForm,
    FaturamentoModel? faturaOs,
    ItemForm? itemForm,
    List<ObservacaoModel>? observacoesModelList,
    OrdemDeServicoModel? ordemdeServico,
    ImageModel? image,
    ImageModel? fotoProduto,
    ObservacaoModel? observacao,
    String? message,
    bool? loading,
  }) {
    return OrdemDeServicoState(
      status: status ?? this.status,
      servicos: servicos ?? this.servicos,
      clientes: clientes ?? this.clientes,
      itens: itens ?? this.itens,
      clienteSelecionando: clienteSelecionando ?? this.clienteSelecionando,
      ordemServicioForm: ordemServicioForm ?? this.ordemServicioForm,
      faturaOs: faturaOs ?? this.faturaOs,
      itemForm: itemForm ?? this.itemForm,
      observacoesModelList: observacoesModelList ?? this.observacoesModelList,
      ordemdeServico: ordemdeServico ?? this.ordemdeServico,
      image: image ?? this.image,
      fotoProduto: fotoProduto ?? this.fotoProduto,
      observacao: observacao ?? this.observacao,
      message: message ?? this.message,
      loading: loading ?? this.loading,
    );
  }
}

@JsonSerializable()
class OrdemDeServicoForm {
  OrdemDeServicoForm({
    this.id,
    this.clienteId,
    this.numeroPedido,
    this.itens,
    this.fatura,
    this.pathAssinaturaCliente,
    this.pathFotoAltorizacaoCliente,
    this.createdAt,
    this.updatedAt,
  });

  String? id;

  @JsonKey(name: 'cliente_id')
  String? clienteId;

  @StringToIntConverter()
  @JsonKey(name: 'numero_pedido')
  int? numeroPedido;

  List<ItemForm>? itens;

  List<FaturamentoModel>? fatura;

  @JsonKey(name: 'path_assinatura_cliente')
  ImageModel? pathAssinaturaCliente;

  @JsonKey(name: 'path_foto_altorizacao_cliente')
  ImageModel? pathFotoAltorizacaoCliente;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  OrdemDeServicoForm copyWith({
    String? id,
    String? clienteId,
    int? numeroPedido,
    List<ItemForm>? itens,
    List<FaturamentoModel>? fatura,
    ImageModel? pathAssinaturaCliente,
    ImageModel? pathFotoAltorizacaoCliente,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrdemDeServicoForm(
      id: id ?? this.id,
      clienteId: clienteId ?? this.clienteId,
      numeroPedido: numeroPedido ?? this.numeroPedido,
      itens: itens ?? this.itens,
      fatura: fatura ?? this.fatura,
      pathAssinaturaCliente:
          pathAssinaturaCliente ?? this.pathAssinaturaCliente,
      pathFotoAltorizacaoCliente:
          pathFotoAltorizacaoCliente ?? this.pathFotoAltorizacaoCliente,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$OrdemDeServicoFormToJson(this);

  factory OrdemDeServicoForm.fromJson(Map<String, dynamic> json) =>
      _$OrdemDeServicoFormFromJson(json);
}

@JsonSerializable()
class ItemForm {
  ItemForm({
    this.tipoIdetem,
    this.nomeDoItem,
    this.comprimento,
    this.largura,
    this.observacoes,
    this.fotoProduto,
    this.servicos,
    this.nomeDosServicos,
    this.total,
  });

  @JsonKey(name: 'tipo_item')
  String? tipoIdetem;

  @JsonKey(name: 'nome_do_item')
  String? nomeDoItem;

  @StringToDoubleConverter()
  double? comprimento;

  @StringToDoubleConverter()
  double? largura;

  @JsonKey(name: 'foto_produto')
  ImageModel? fotoProduto;

  @JsonKey(name: 'observacoes')
  List<ObservacaoModel>? observacoes;

  List<ServicoModel>? servicos;

  @JsonKey(name: 'nome_dos_servicos')
  List<String>? nomeDosServicos;

  @StringToDoubleConverter()
  double? total;

  ItemForm copyWith({
    String? tipoIdetem,
    String? nomeDoItem,
    double? comprimento,
    double? largura,
    ImageModel? fotoProduto,
    List<ObservacaoModel>? observacoes,
    List<ServicoModel>? servicos,
    List<String>? nomeDosServicos,
    double? total,
  }) {
    return ItemForm(
      tipoIdetem: tipoIdetem ?? this.tipoIdetem,
      nomeDoItem: nomeDoItem ?? this.nomeDoItem,
      comprimento: comprimento ?? this.comprimento,
      largura: largura ?? this.largura,
      fotoProduto: fotoProduto ?? this.fotoProduto,
      observacoes: observacoes ?? this.observacoes,
      servicos: servicos ?? this.servicos,
      nomeDosServicos: nomeDosServicos ?? this.nomeDosServicos,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toJson() => _$ItemFormToJson(this);

  factory ItemForm.fromJson(Map<String, dynamic> json) =>
      _$ItemFormFromJson(json);
}
