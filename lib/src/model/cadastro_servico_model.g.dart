// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroServicoModel _$CadastroServicoModelFromJson(
        Map<String, dynamic> json) =>
    CadastroServicoModel(
      id: json['id'] as String?,
      nomeDoServico: json['nomeDoServico'] as String,
      categoriaSelecionada: json['categoriaSelecionada'] as String?,
      metroQuadrado: json['metroQuadrado'] as bool?,
      metroLinear: json['metroLinear'] as bool?,
      valorFixo: json['valorFixo'] as bool?,
      valorManual: json['valorManual'] as bool?,
      porcentagemServico: json['porcentagemServico'] as bool?,
      servicoSelecionando: json['servicoSelecionando'] as String?,
      porcentagem: json['porcentagem'] as int?,
      userId: json['userId'] as String,
      valor: json['valor'] as int?,
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
      'userId': instance.userId,
      'nomeDoServico': instance.nomeDoServico,
      'categoriaSelecionada': instance.categoriaSelecionada,
      'metroQuadrado': instance.metroQuadrado,
      'metroLinear': instance.metroLinear,
      'valorFixo': instance.valorFixo,
      'valorManual': instance.valorManual,
      'porcentagemServico': instance.porcentagemServico,
      'servicoSelecionando': instance.servicoSelecionando,
      'porcentagem': instance.porcentagem,
      'valor': instance.valor,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
