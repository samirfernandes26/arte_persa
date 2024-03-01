// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaturamentoModel _$FaturamentoModelFromJson(Map<String, dynamic> json) =>
    FaturamentoModel(
      servicosIds: (json['servicos_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      clienteId: json['cliente_id'] as String?,
      ordemDeServicoId: json['ordem_de_servico_id'] as String?,
      descontoDado: const StringToDoubleConverter()
          .fromJson(json['desconto_dado'] as String?),
      valorFinalDaNota: const StringToDoubleConverter()
          .fromJson(json['valor_final_da_nota'] as String?),
      adiantamento: const StringToDoubleConverter()
          .fromJson(json['adiantamento'] as String?),
      formaDePagamento: json['forma_de_pagamento'] as String?,
      statusDoPagamento: json['status_do_pagamento'] as String?,
      comprovantePagamento: json['comprovante_pagamento'] == null
          ? null
          : ImageModel.fromJson(
              json['comprovante_pagamento'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FaturamentoModelToJson(FaturamentoModel instance) =>
    <String, dynamic>{
      'servicos_ids': instance.servicosIds,
      'cliente_id': instance.clienteId,
      'ordem_de_servico_id': instance.ordemDeServicoId,
      'desconto_dado':
          const StringToDoubleConverter().toJson(instance.descontoDado),
      'valor_final_da_nota':
          const StringToDoubleConverter().toJson(instance.valorFinalDaNota),
      'adiantamento':
          const StringToDoubleConverter().toJson(instance.adiantamento),
      'forma_de_pagamento': instance.formaDePagamento,
      'status_do_pagamento': instance.statusDoPagamento,
      'comprovante_pagamento': instance.comprovantePagamento,
    };
