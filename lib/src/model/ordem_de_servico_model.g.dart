// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_de_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdemDeServicoModel _$OrdemDeServicoModelFromJson(Map<String, dynamic> json) =>
    OrdemDeServicoModel(
      id: json['id'] as String?,
      servicosIds: (json['servicos_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      observacoesIds: (json['observacoes_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      clienteId: json['cliente_id'] as String?,
      numeroPedido: _$JsonConverterFromJson<String, int>(
          json['numero_pedido'], const StringToIntConverter().fromJson),
      tipoIdetem: json['tipo_item'] as String?,
      comprimento: const StringToDoubleConverter()
          .fromJson(json['comprimento'] as String?),
      largura:
          const StringToDoubleConverter().fromJson(json['largura'] as String?),
      fotoProduto: json['foto_produto'] == null
          ? null
          : ImageModel.fromJson(json['foto_produto'] as Map<String, dynamic>),
      total: const StringToDoubleConverter().fromJson(json['total'] as String?),
      desconto:
          const StringToDoubleConverter().fromJson(json['desconto'] as String?),
      adiantamento: const StringToDoubleConverter()
          .fromJson(json['adiantamento'] as String?),
      formaPagamento: json['forma_pagamento'] as String?,
      pathAssinaturaCliente: json['path_assinatura_cliente'] as String?,
      pathFotoAltorizacaoCliente:
          json['path_foto_altorizacao_cliente'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrdemDeServicoModelToJson(
        OrdemDeServicoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'servicos_ids': instance.servicosIds,
      'observacoes_ids': instance.observacoesIds,
      'cliente_id': instance.clienteId,
      'numero_pedido': _$JsonConverterToJson<String, int>(
          instance.numeroPedido, const StringToIntConverter().toJson),
      'tipo_item': instance.tipoIdetem,
      'comprimento':
          const StringToDoubleConverter().toJson(instance.comprimento),
      'largura': const StringToDoubleConverter().toJson(instance.largura),
      'foto_produto': instance.fotoProduto,
      'total': const StringToDoubleConverter().toJson(instance.total),
      'desconto': const StringToDoubleConverter().toJson(instance.desconto),
      'adiantamento':
          const StringToDoubleConverter().toJson(instance.adiantamento),
      'forma_pagamento': instance.formaPagamento,
      'path_assinatura_cliente': instance.pathAssinaturaCliente,
      'path_foto_altorizacao_cliente': instance.pathFotoAltorizacaoCliente,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
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
