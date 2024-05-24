// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) => UsuarioModel(
      id: json['id'] as String?,
      email: json['email'] as String,
      senha: json['senha'] as String?,
      nome: json['nome'] as String,
      sobrenome: json['sobre_nome'] as String,
      cpf: json['cpf'] as String,
      telefoneContatoUm: json['telefone_contato_um'] as String,
      contatoUmWhatsapp: json['contato_um_whatsapp'] as bool,
      telefoneContatoDois: json['telefone_contato_dois'] as String?,
      contatoDoisWhatsapp: json['contato_dois_whatsapp'] as bool,
      dataNascimento: json['data_nascimento'] as String,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'senha': instance.senha,
      'nome': instance.nome,
      'sobre_nome': instance.sobrenome,
      'cpf': instance.cpf,
      'telefone_contato_um': instance.telefoneContatoUm,
      'contato_um_whatsapp': instance.contatoUmWhatsapp,
      'telefone_contato_dois': instance.telefoneContatoDois,
      'contato_dois_whatsapp': instance.contatoDoisWhatsapp,
      'data_nascimento': instance.dataNascimento,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
