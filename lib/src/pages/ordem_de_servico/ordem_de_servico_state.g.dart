// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_de_servico_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdemDeServicoForm _$OrdemDeServicoFormFromJson(Map<String, dynamic> json) =>
    OrdemDeServicoForm(
      id: json['id'] as String?,
      clienteId: json['cliente_id'] as String?,
      numeroOs: _$JsonConverterFromJson<String, int>(
          json['numero_pedido'], const StringToIntConverter().fromJson),
      itens: (json['itens'] as List<dynamic>?)
          ?.map((e) => ItemForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      fatura: (json['fatura'] as List<dynamic>?)
          ?.map((e) => FaturamentoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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

Map<String, dynamic> _$OrdemDeServicoFormToJson(OrdemDeServicoForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente_id': instance.clienteId,
      'numero_pedido': _$JsonConverterToJson<String, int>(
          instance.numeroOs, const StringToIntConverter().toJson),
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

ItemForm _$ItemFormFromJson(Map<String, dynamic> json) => ItemForm(
      tipoItem: json['tipo_item'] as String?,
      nomeDoItem: json['nome_do_item'] as String?,
      comprimento: _$JsonConverterFromJson<String, double>(
          json['comprimento'], const StringToDoubleConverter().fromJson),
      largura: _$JsonConverterFromJson<String, double>(
          json['largura'], const StringToDoubleConverter().fromJson),
      observacoes: (json['observacoes'] as List<dynamic>?)
          ?.map((e) => ObservacaoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fotoProduto: json['foto_produto'] == null
          ? null
          : ImageModel.fromJson(json['foto_produto'] as Map<String, dynamic>),
      servicos: (json['servicos'] as List<dynamic>?)
          ?.map((e) => ServicoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nomeDosServicos: (json['nome_dos_servicos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      total: _$JsonConverterFromJson<String, double>(
          json['total'], const StringToDoubleConverter().fromJson),
    );

Map<String, dynamic> _$ItemFormToJson(ItemForm instance) => <String, dynamic>{
      'tipo_item': instance.tipoItem,
      'nome_do_item': instance.nomeDoItem,
      'comprimento': _$JsonConverterToJson<String, double>(
          instance.comprimento, const StringToDoubleConverter().toJson),
      'largura': _$JsonConverterToJson<String, double>(
          instance.largura, const StringToDoubleConverter().toJson),
      'foto_produto': instance.fotoProduto,
      'observacoes': instance.observacoes,
      'servicos': instance.servicos,
      'nome_dos_servicos': instance.nomeDosServicos,
      'total': _$JsonConverterToJson<String, double>(
          instance.total, const StringToDoubleConverter().toJson),
    };
