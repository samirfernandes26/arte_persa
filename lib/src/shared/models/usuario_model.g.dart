// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) => UsuarioModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      email: json['email'] as String,
      perfil: const PerfilUsuarioModelConverter().fromJson(json['perfil']),
      ativo: json['ativo'] as bool,
      ultimoLoginEm: json['ultimo_login_em'] == null
          ? null
          : DateTime.parse(json['ultimo_login_em'] as String),
      dataCriacao: DateTime.parse(json['data_criacao'] as String),
      dataAtualizacao: DateTime.parse(json['data_atualizacao'] as String),
      dataExclusao: json['data_exclusao'] == null
          ? null
          : DateTime.parse(json['data_exclusao'] as String),
    );

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      if (const PerfilUsuarioModelConverter().toJson(instance.perfil)
          case final value?)
        'perfil': value,
      'ativo': instance.ativo,
      if (instance.ultimoLoginEm?.toIso8601String() case final value?)
        'ultimo_login_em': value,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
