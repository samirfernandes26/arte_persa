// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenRefreshModel _$TokenRefreshModelFromJson(Map<String, dynamic> json) =>
    TokenRefreshModel(
      id: json['id'] as String,
      usuarioId: json['usuario_id'] as String,
      familiaToken: json['familia_token'] as String?,
      expiraEm: DateTime.parse(json['expira_em'] as String),
      revogadoEm: json['revogado_em'] == null
          ? null
          : DateTime.parse(json['revogado_em'] as String),
      ipOrigem: json['ip_origem'] as String?,
      agenteUsuario: json['agente_usuario'] as String?,
      ativo: json['ativo'] as bool,
      dataCriacao: DateTime.parse(json['data_criacao'] as String),
      dataAtualizacao: DateTime.parse(json['data_atualizacao'] as String),
      dataExclusao: json['data_exclusao'] == null
          ? null
          : DateTime.parse(json['data_exclusao'] as String),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(json['usuario'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenRefreshModelToJson(TokenRefreshModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuario_id': instance.usuarioId,
      if (instance.familiaToken case final value?) 'familia_token': value,
      'expira_em': instance.expiraEm.toIso8601String(),
      if (instance.revogadoEm?.toIso8601String() case final value?)
        'revogado_em': value,
      if (instance.ipOrigem case final value?) 'ip_origem': value,
      if (instance.agenteUsuario case final value?) 'agente_usuario': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
