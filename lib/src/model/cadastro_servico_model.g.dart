// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroServicoModel _$CadastroServicoModelFromJson(
        Map<String, dynamic> json) =>
    CadastroServicoModel(
      id: json['id'] as String?,
      nomeDoServico: json['nome_do_servico'] as String,
      categoriaSelecionada: json['categoria_selecionada'] as String?,
      metroQuadrado: json['metro_quadrado'] as bool?,
      metroLinear: json['metro_linear'] as bool?,
      valorFixo: json['valor_fixo'] as bool?,
      valorManual: json['valor_manual'] as bool?,
      porcentagemServico: json['porcentagem_servico'] as bool?,
      servicoSelecionando: json['servico_selecionado'] as String?,
      porcentagem: _$JsonConverterFromJson<String, int>(
          json['porcentagem'], const StringToIntConverter().fromJson),
      userId: json['user_id'] as String?,
      valor: const StringToDoubleConverter().fromJson(json['valor'] as String?),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CadastroServicoModelToJson(
        CadastroServicoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'porcentagem': _$JsonConverterToJson<String, int>(
          instance.porcentagem, const StringToIntConverter().toJson),
      'valor': const StringToDoubleConverter().toJson(instance.valor),
      'user_id': instance.userId,
      'nome_do_servico': instance.nomeDoServico,
      'categoria_selecionada': instance.categoriaSelecionada,
      'metro_quadrado': instance.metroQuadrado,
      'metro_linear': instance.metroLinear,
      'valor_fixo': instance.valorFixo,
      'valor_manual': instance.valorManual,
      'porcentagem_servico': instance.porcentagemServico,
      'servico_selecionado': instance.servicoSelecionando,
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
