import 'package:json_annotation/json_annotation.dart';

import 'package:arte_persa/src/core/helpers/json_converter.dart';

part 'ordem_de_servico_model.g.dart';

@JsonSerializable()
class OrdemDeServicoModel {
  OrdemDeServicoModel({
    this.id,
    this.servicosIds,
    this.observacoesIds,
    this.clienteId,
    this.numeroPedido,
    this.tipoIdetem,
    this.comprimento,
    this.largura,
    this.pathFotoProduto,
    this.total,
    this.desconto,
    this.adiantamento,
    this.formaPagamento,
    this.pathAssinaturaCliente,
    this.pathFotoAltorizacaoCliente,
    this.createdAt,
    this.updatedAt,
  });

  String? id;

  @JsonKey(name: 'servicos_ids')
  List<String>? servicosIds;

  @JsonKey(name: 'observacoes_ids')
  List<String>? observacoesIds;

  @JsonKey(name: 'cliente_id')
  String? clienteId;

  @StringToIntConverter()
  @JsonKey(name: 'numero_pedido')
  int? numeroPedido;

  @JsonKey(name: 'tipo_item')
  String? tipoIdetem;

  @StringToDoubleConverter()
  double? comprimento;

  @StringToDoubleConverter()
  double? largura;

  @JsonKey(name: 'path_foto_produto')
  String? pathFotoProduto;

  @StringToDoubleConverter()
  double? total;

  @StringToDoubleConverter()
  double? desconto;

  @StringToDoubleConverter()
  double? adiantamento;

  @JsonKey(name: 'forma_pagamento')
  String? formaPagamento;

  @JsonKey(name: 'path_assinatura_cliente')
  String? pathAssinaturaCliente;

  @JsonKey(name: 'path_foto_altorizacao_cliente')
  String? pathFotoAltorizacaoCliente;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$OrdemDeServicoModelToJson(this);
  factory OrdemDeServicoModel.fromJson(Map<String, dynamic> json) =>
      _$OrdemDeServicoModelFromJson(json);
}
