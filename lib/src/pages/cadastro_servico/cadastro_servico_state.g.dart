// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_servico_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastrosServicoForm _$CadastrosServicoFormFromJson(
        Map<String, dynamic> json) =>
    CadastrosServicoForm(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      nomeDoServico: json['nomeDoServico'] as String,
      categoriaSelecionada: json['categoriaSelecionada'] as String,
      metroQuadrado: json['metroQuadrado'] as bool,
      metroLinear: json['metroLinear'] as bool,
      valorFixo: json['valorFixo'] as bool,
      valorManual: json['valorManual'] as bool,
      valor: (json['valor'] as num?)?.toDouble(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CadastrosServicoFormToJson(
        CadastrosServicoForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'nomeDoServico': instance.nomeDoServico,
      'categoriaSelecionada': instance.categoriaSelecionada,
      'metroQuadrado': instance.metroQuadrado,
      'metroLinear': instance.metroLinear,
      'valorFixo': instance.valorFixo,
      'valorManual': instance.valorManual,
      'valor': instance.valor,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
