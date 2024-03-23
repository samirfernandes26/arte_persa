import 'package:arte_persa/src/model/observacao_model.dart';
import 'package:arte_persa/src/model/servico_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/image_model.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  ItemModel({
    this.id,
    required this.tipoItem,
    required this.nomeDoItem,
    this.comprimento,
    this.largura,
    this.observacoes,
    this.fotoProduto,
    this.servicos,
    this.nomeDosServicos,
    this.total,
  });

  String? id;

  @JsonKey(name: 'tipo_item')
  String tipoItem;

  @JsonKey(name: 'nome_do_item')
  String nomeDoItem;

  @StringToDoubleConverter()
  double? comprimento;

  @StringToDoubleConverter()
  double? largura;

  @JsonKey(name: 'foto_produto')
  ImageModel? fotoProduto;

  @JsonKey(name: 'observacoes')
  List<ObservacaoModel>? observacoes;

  @JsonKey(toJson: servicosToJson)
  List<ServicoModel>? servicos;

  @JsonKey(name: 'nome_dos_servicos')
  List<String>? nomeDosServicos;

  @StringOrToDoubleConverter()
  double? total;

  ItemModel copyWith({
    String? id,
    String? tipoItem,
    String? nomeDoItem,
    double? comprimento,
    double? largura,
    ImageModel? fotoProduto,
    List<ObservacaoModel>? observacoes,
    List<ServicoModel>? servicos,
    List<String>? nomeDosServicos,
    double? total,
  }) {
    return ItemModel(
      id: id ?? this.id,
      tipoItem: tipoItem ?? this.tipoItem,
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

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  static servicosToJson(List<ServicoModel>? obj) =>
      obj?.map((servico) => servico.nomeDoServico).toList();
}
