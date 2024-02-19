// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CadastroModel _$CadastroModelFromJson(Map<String, dynamic> json) =>
    CadastroModel(
      id: json['id'] as int?,
      email: json['email'] as String,
      token: json['token'] as String?,
      nome: json['nome'] as String?,
      sobrenome: json['sobrenome'] as String?,
      cpf: json['cpf'] as String?,
      telefoneContatoUm: json['telefone_contato_um'] as String?,
      telefoneContatoDois: json['telefone_contato_dois'] as String?,
      dataNascimento: json['data_nascimento'] == null
          ? null
          : DateTime.parse(json['data_nascimento'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CadastroModelToJson(CadastroModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token': instance.token,
      'nome': instance.nome,
      'sobrenome': instance.sobrenome,
      'cpf': instance.cpf,
      'telefone_contato_um': instance.telefoneContatoUm,
      'telefone_contato_dois': instance.telefoneContatoDois,
      'data_nascimento': instance.dataNascimento?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
