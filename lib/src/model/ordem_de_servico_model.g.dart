// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_de_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdemDeServicoModel _$OrdemDeServicoModelFromJson(Map<String, dynamic> json) =>
    OrdemDeServicoModel(
      id: json['id'] as String?,
      clienteId: json['cliente_id'] as String?,
      numeroPedido: _$JsonConverterFromJson<String, int>(
          json['numero_pedido'], const StringToIntConverter().fromJson),
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fatura: FaturamentoModel.fromJson(json['fatura'] as Map<String, dynamic>),
      assinaturaCliente: json['assinatura_cliente'] == null
          ? null
          : ImageModel.fromJson(
              json['assinatura_cliente'] as Map<String, dynamic>),
      fotoAltorizacaoCliente: json['foto_altorizacao_cliente'] == null
          ? null
          : ImageModel.fromJson(
              json['foto_altorizacao_cliente'] as Map<String, dynamic>),
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
      'cliente_id': instance.clienteId,
      'numero_pedido': _$JsonConverterToJson<String, int>(
          instance.numeroPedido, const StringToIntConverter().toJson),
      'itens': instance.itens,
      'fatura': instance.fatura,
      'assinatura_cliente': instance.assinaturaCliente,
      'foto_altorizacao_cliente': instance.fotoAltorizacaoCliente,
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
