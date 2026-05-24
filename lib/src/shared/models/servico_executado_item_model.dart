// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'decimal_json_converter.dart';
import 'enum_json_converters.dart';
import 'item_ordem_servico_model.dart';
import 'servico_catalogo_model.dart';
import 'unidade_cobranca_servico_model.dart';

part 'servico_executado_item_model.g.dart';

/// Servico vendido ou executado para um item da ordem.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ServicoExecutadoItemModel {
  final String id;
  @JsonKey(name: 'item_ordem_servico_id')
  final String itemOrdemServicoId;
  @JsonKey(name: 'servico_catalogo_id')
  final String? servicoCatalogoId;
  @JsonKey(name: 'nome_servico_snapshot')
  final String nomeServicoSnapshot;
  @JsonKey(name: 'categoria_servico_snapshot')
  final String? categoriaServicoSnapshot;
  @JsonKey(name: 'unidade_cobranca_snapshot')
  @UnidadeCobrancaServicoModelConverter()
  final UnidadeCobrancaServicoModel unidadeCobrancaSnapshot;
  @JsonKey(name: 'valor_unitario_snapshot')
  @DecimalJsonConverter()
  final String valorUnitarioSnapshot;
  @DecimalJsonConverter()
  final String quantidade;
  @JsonKey(name: 'valor_desconto')
  @DecimalJsonConverter()
  final String valorDesconto;
  @JsonKey(name: 'valor_total')
  @DecimalJsonConverter()
  final String valorTotal;
  final String? observacoes;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(name: 'item_ordem_servico', includeToJson: false)
  final ItemOrdemServicoModel? itemOrdemServico;
  @JsonKey(name: 'servico_catalogo', includeToJson: false)
  final ServicoCatalogoModel? servicoCatalogo;

  const ServicoExecutadoItemModel({
    required this.id,
    required this.itemOrdemServicoId,
    this.servicoCatalogoId,
    required this.nomeServicoSnapshot,
    this.categoriaServicoSnapshot,
    required this.unidadeCobrancaSnapshot,
    required this.valorUnitarioSnapshot,
    required this.quantidade,
    required this.valorDesconto,
    required this.valorTotal,
    this.observacoes,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.itemOrdemServico,
    this.servicoCatalogo,
  });

  factory ServicoExecutadoItemModel.fromJson(Map<String, dynamic> json) =>
      _$ServicoExecutadoItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicoExecutadoItemModelToJson(this);

  ServicoExecutadoItemModel copyWith({
    String? id,
    String? itemOrdemServicoId,
    String? servicoCatalogoId,
    String? nomeServicoSnapshot,
    String? categoriaServicoSnapshot,
    UnidadeCobrancaServicoModel? unidadeCobrancaSnapshot,
    String? valorUnitarioSnapshot,
    String? quantidade,
    String? valorDesconto,
    String? valorTotal,
    String? observacoes,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ItemOrdemServicoModel? itemOrdemServico,
    ServicoCatalogoModel? servicoCatalogo,
  }) =>
      ServicoExecutadoItemModel(
        id: id ?? this.id,
        itemOrdemServicoId: itemOrdemServicoId ?? this.itemOrdemServicoId,
        servicoCatalogoId: servicoCatalogoId ?? this.servicoCatalogoId,
        nomeServicoSnapshot: nomeServicoSnapshot ?? this.nomeServicoSnapshot,
        categoriaServicoSnapshot:
            categoriaServicoSnapshot ?? this.categoriaServicoSnapshot,
        unidadeCobrancaSnapshot:
            unidadeCobrancaSnapshot ?? this.unidadeCobrancaSnapshot,
        valorUnitarioSnapshot:
            valorUnitarioSnapshot ?? this.valorUnitarioSnapshot,
        quantidade: quantidade ?? this.quantidade,
        valorDesconto: valorDesconto ?? this.valorDesconto,
        valorTotal: valorTotal ?? this.valorTotal,
        observacoes: observacoes ?? this.observacoes,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        itemOrdemServico: itemOrdemServico ?? this.itemOrdemServico,
        servicoCatalogo: servicoCatalogo ?? this.servicoCatalogo,
      );
}
