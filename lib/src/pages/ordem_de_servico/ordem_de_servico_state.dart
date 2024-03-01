import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/cliente_model.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:arte_persa/src/model/item_model.dart';
import 'package:arte_persa/src/model/observacao_model.dart';
import 'package:arte_persa/src/model/ordem_de_servico_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:json_annotation/json_annotation.dart';

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
        );

  OrdemDeServicoState({
    required this.status,
    this.servicos,
    this.clientes,
    this.observacoes,
    this.message,
    this.loading,
    this.ordemdeServico,
    this.image,
    this.observacao,
    this.itens,
    this.itemForm,
  });

  OrdemDeServicoStateStatus status;
  List<ServicoModel>? servicos;
  List<ClienteModel>? clientes;
  List<ObservacaoModel>? observacoes;

  List<ItemModel>? itens;
  ItemForm? itemForm;

  OrdemDeServicoModel? ordemdeServico;
  ImageModel? image;
  ObservacaoModel? observacao;

  String? message;
  bool? loading;

  OrdemDeServicoState copyWith({
    OrdemDeServicoStateStatus? status,
    List<ServicoModel>? servicos,
    List<ClienteModel>? clientes,
    List<ObservacaoModel>? observacoes,
    List<ItemModel>? itens,
    ItemForm? itemForm,
    OrdemDeServicoModel? ordemdeServico,
    ImageModel? image,
    ObservacaoModel? observacao,
    String? message,
    bool? loading,
  }) {
    return OrdemDeServicoState(
      status: status ?? this.status,
      servicos: servicos ?? this.servicos,
      clientes: clientes ?? this.clientes,
      observacoes: observacoes ?? this.observacoes,
      itens: itens ?? this.itens,
      itemForm: itemForm ?? this.itemForm,
      ordemdeServico: ordemdeServico ?? this.ordemdeServico,
      image: image ?? this.image,
      observacao: observacao ?? this.observacao,
      message: message ?? this.message,
      loading: loading ?? this.loading,
    );
  }
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
    this.servicosIds,
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

  @JsonKey(name: 'servicos_ids')
  List<String>? servicosIds;

  @StringToDoubleConverter()
  double? total;

  ItemForm copyWith({
    String? tipoIdetem,
    String? nomeDoItem,
    double? comprimento,
    double? largura,
    ImageModel? fotoProduto,
    List<ObservacaoModel>? observacoes,
    List<String>? servicosIds,
    double? total,
  }) {
    return ItemForm(
      tipoIdetem: tipoIdetem ?? this.tipoIdetem,
      nomeDoItem: nomeDoItem ?? this.nomeDoItem,
      comprimento: comprimento ?? this.comprimento,
      largura: largura ?? this.largura,
      fotoProduto: fotoProduto ?? this.fotoProduto,
      observacoes: observacoes ?? this.observacoes,
      servicosIds: servicosIds ?? this.servicosIds,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toJson() => _$ItemFormToJson(this);

  factory ItemForm.fromJson(Map<String, dynamic> json) =>
      _$ItemFormFromJson(json);
}
