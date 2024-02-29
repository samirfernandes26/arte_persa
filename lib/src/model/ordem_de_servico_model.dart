import 'package:arte_persa/src/model/image_model.dart';
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
    this.fotoProduto,
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

  @JsonKey(name: 'foto_produto')
  ImageModel? fotoProduto;

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

  OrdemDeServicoModel copyWith({
    String? id,
    List<String>? servicosIds,
    List<String>? observacoesIds,
    String? clienteId,
    int? numeroPedido,
    String? tipoIdetem,
    double? comprimento,
    double? largura,
    ImageModel? fotoProduto,
    double? total,
    double? desconto,
    double? adiantamento,
    String? formaPagamento,
    String? pathAssinaturaCliente,
    String? pathFotoAltorizacaoCliente,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      OrdemDeServicoModel(
        id: id ?? this.id,
        servicosIds: servicosIds ?? this.servicosIds,
        observacoesIds: observacoesIds ?? this.observacoesIds,
        clienteId: clienteId ?? this.clienteId,
        numeroPedido: numeroPedido ?? this.numeroPedido,
        tipoIdetem: tipoIdetem ?? this.tipoIdetem,
        comprimento: comprimento ?? this.comprimento,
        largura: largura ?? this.largura,
        fotoProduto: fotoProduto ?? this.fotoProduto,
        total: total ?? this.total,
        desconto: desconto ?? this.desconto,
        adiantamento: adiantamento ?? this.adiantamento,
        formaPagamento: formaPagamento ?? this.formaPagamento,
        pathAssinaturaCliente:
            pathAssinaturaCliente ?? this.pathAssinaturaCliente,
        pathFotoAltorizacaoCliente:
            pathFotoAltorizacaoCliente ?? this.pathFotoAltorizacaoCliente,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
