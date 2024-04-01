// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaturamentoModel _$FaturamentoModelFromJson(Map<String, dynamic> json) =>
    FaturamentoModel(
      id: json['id'] as String?,
      clienteId: json['cliente_id'] as String?,
      ordemDeServicoId: json['ordem_de_servico_id'] as String?,
      descontoAplicado: _$JsonConverterFromJson<String, double>(
          json['desconto_aplicado'], const StringToDoubleConverter().fromJson),
      valorFinalDaNota: _$JsonConverterFromJson<String, double>(
          json['valor_final_da_nota'],
          const StringToDoubleConverter().fromJson),
      totalBruto: _$JsonConverterFromJson<String, double>(
          json['total_bruto'], const StringToDoubleConverter().fromJson),
      adiantamento: _$JsonConverterFromJson<String, double>(
          json['adiantamento'], const StringToDoubleConverter().fromJson),
      formaDePagamento: json['forma_de_pagamento'] as String?,
      statusDoPagamento: json['status_do_pagamento'] as String?,
      comprovantePagamento: json['comprovante_pagamento'] == null
          ? null
          : ImageModel.fromJson(
              json['comprovante_pagamento'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaturamentoModelToJson(FaturamentoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente_id': instance.clienteId,
      'ordem_de_servico_id': instance.ordemDeServicoId,
      'desconto_aplicado': _$JsonConverterToJson<String, double>(
          instance.descontoAplicado, const StringToDoubleConverter().toJson),
      'valor_final_da_nota': _$JsonConverterToJson<String, double>(
          instance.valorFinalDaNota, const StringToDoubleConverter().toJson),
      'total_bruto': _$JsonConverterToJson<String, double>(
          instance.totalBruto, const StringToDoubleConverter().toJson),
      'adiantamento': _$JsonConverterToJson<String, double>(
          instance.adiantamento, const StringToDoubleConverter().toJson),
      'forma_de_pagamento': instance.formaDePagamento,
      'status_do_pagamento': instance.statusDoPagamento,
      'comprovante_pagamento': instance.comprovantePagamento,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
