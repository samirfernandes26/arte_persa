// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      tipoItem: json['tipo_item'] as String,
      nomeDoItem: json['nome_do_item'] as String,
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
      total:
          const StringOrToDoubleConverter().fromJson(json['total'] as String?),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'tipo_item': instance.tipoItem,
      'nome_do_item': instance.nomeDoItem,
      'comprimento': _$JsonConverterToJson<String, double>(
          instance.comprimento, const StringToDoubleConverter().toJson),
      'largura': _$JsonConverterToJson<String, double>(
          instance.largura, const StringToDoubleConverter().toJson),
      'foto_produto': instance.fotoProduto,
      'observacoes': instance.observacoes,
      'servicos': ItemModel.servicosToJson(instance.servicos),
      'nome_dos_servicos': instance.nomeDosServicos,
      'total': const StringOrToDoubleConverter().toJson(instance.total),
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
