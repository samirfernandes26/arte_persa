// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicoModel _$ServicoModelFromJson(Map<String, dynamic> json) => ServicoModel(
      id: json['id'] as String?,
      nomeDoServico: json['nome_do_servico'] as String,
      categoriaSelecionada: json['categoria_selecionada'] as String,
      metroQuadrado: json['metro_quadrado'] as bool,
      metroLinear: json['metro_linear'] as bool,
      valorFixo: json['valor_fixo'] as bool,
      valorManual: json['valor_manual'] as bool,
      userId: json['user_id'] as String,
      valor: _$JsonConverterFromJson<String, double>(
          json['valor'], const StringToDoubleConverter().fromJson),
      valorCalculo: _$JsonConverterFromJson<String, double>(
          json['valor_calculo'], const StringToDoubleConverter().fromJson),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ServicoModelToJson(ServicoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'valor': _$JsonConverterToJson<String, double>(
          instance.valor, const StringToDoubleConverter().toJson),
      'user_id': instance.userId,
      'valor_calculo': _$JsonConverterToJson<String, double>(
          instance.valorCalculo, const StringToDoubleConverter().toJson),
      'nome_do_servico': instance.nomeDoServico,
      'categoria_selecionada': instance.categoriaSelecionada,
      'metro_quadrado': instance.metroQuadrado,
      'metro_linear': instance.metroLinear,
      'valor_fixo': instance.valorFixo,
      'valor_manual': instance.valorManual,
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
