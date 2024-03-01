import 'package:json_annotation/json_annotation.dart';

import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/image_model.dart';

part 'faturamento_model.g.dart';

@JsonSerializable()
class FaturamentoModel {
  FaturamentoModel({
    this.servicosIds,
    this.clienteId,
    this.ordemDeServicoId,
    this.descontoDado,
    this.valorFinalDaNota,
    this.adiantamento,
    this.formaDePagamento,
    this.statusDoPagamento,
    this.comprovantePagamento,
  });

  @JsonKey(name: 'servicos_ids')
  List<String>? servicosIds;

  @JsonKey(name: 'cliente_id')
  String? clienteId;

  @JsonKey(name: 'ordem_de_servico_id')
  String? ordemDeServicoId;

  @JsonKey(name: 'desconto_dado')
  @StringToDoubleConverter()
  double? descontoDado;

  @StringToDoubleConverter()
  @JsonKey(name: 'valor_final_da_nota')
  double? valorFinalDaNota;

  @StringToDoubleConverter()
  double? adiantamento;

  @JsonKey(name: 'forma_de_pagamento')
  String? formaDePagamento;

  @JsonKey(name: 'status_do_pagamento')
  String? statusDoPagamento;

  @JsonKey(name: 'comprovante_pagamento')
  ImageModel? comprovantePagamento;

  FaturamentoModel copyWith({
    List<String>? servicosIds,
    String? clienteId,
    String? ordemDeServicoId,
    double? descontoDado,
    double? valorFinalDaNota,
    double? adiantamento,
    String? formaDePagamento,
    String? statusDoPagamento,
    ImageModel? comprovantePagamento,
  }) {
    return FaturamentoModel(
      servicosIds: servicosIds ?? this.servicosIds,
      clienteId: clienteId ?? this.clienteId,
      ordemDeServicoId: ordemDeServicoId ?? this.ordemDeServicoId,
      descontoDado: descontoDado ?? this.descontoDado,
      valorFinalDaNota: valorFinalDaNota ?? this.valorFinalDaNota,
      adiantamento: adiantamento ?? this.adiantamento,
      formaDePagamento: formaDePagamento ?? this.formaDePagamento,
      statusDoPagamento: statusDoPagamento ?? this.statusDoPagamento,
      comprovantePagamento: comprovantePagamento ?? this.comprovantePagamento,
    );
  }

  factory FaturamentoModel.fromJson(Map<String, dynamic> json) =>
      _$FaturamentoModelFromJson(json);
  Map<String, dynamic> toJson() => _$FaturamentoModelToJson(this);
}
