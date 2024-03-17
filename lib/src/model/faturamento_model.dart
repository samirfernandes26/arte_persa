import 'package:json_annotation/json_annotation.dart';

import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/image_model.dart';

part 'faturamento_model.g.dart';

@JsonSerializable()
class FaturamentoModel {
  FaturamentoModel({
    this.clienteId,
    this.ordemDeServicoId,
    this.descontoAplicado,
    this.valorFinalDaNota,
    this.totalBruto,
    this.adiantamento,
    this.formaDePagamento,
    this.statusDoPagamento,
    this.comprovantePagamento,
  });



  @JsonKey(name: 'cliente_id')
  String? clienteId;

  @JsonKey(name: 'ordem_de_servico_id')
  String? ordemDeServicoId;

  @JsonKey(name: 'desconto_aplicado')
  @StringToDoubleConverter()
  double? descontoAplicado;

  @StringToDoubleConverter()
  @JsonKey(name: 'valor_final_da_nota')
  double? valorFinalDaNota;

  @StringToDoubleConverter()
  @JsonKey(name: 'total_bruto')
  double? totalBruto;

  @StringToDoubleConverter()
  double? adiantamento;

  @JsonKey(name: 'forma_de_pagamento')
  String? formaDePagamento;

  @JsonKey(name: 'status_do_pagamento')
  String? statusDoPagamento;

  @JsonKey(name: 'comprovante_pagamento')
  ImageModel? comprovantePagamento;

  FaturamentoModel copyWith({
    String? clienteId,
    String? ordemDeServicoId,
    double? descontoAplicado,
    double? valorFinalDaNota,
    double? totalBruto,
    double? adiantamento,
    String? formaDePagamento,
    String? statusDoPagamento,
    ImageModel? comprovantePagamento,
  }) {
    return FaturamentoModel(
      clienteId: clienteId ?? this.clienteId,
      ordemDeServicoId: ordemDeServicoId ?? this.ordemDeServicoId,
      descontoAplicado: descontoAplicado ?? this.descontoAplicado,
      valorFinalDaNota: valorFinalDaNota ?? this.valorFinalDaNota,
      totalBruto: totalBruto ?? this.totalBruto,
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
