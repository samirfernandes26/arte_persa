// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContatoModel _$ContatoModelFromJson(Map<String, dynamic> json) => ContatoModel(
      telefoneResidencia: json['telefone_residencia'] as String?,
      telefoneContato: json['telefone_contato'] as String?,
      telefoneCelular: json['telefone_celular'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContatoModelToJson(ContatoModel instance) =>
    <String, dynamic>{
      'telefone_residencia': instance.telefoneResidencia,
      'telefone_contato': instance.telefoneContato,
      'telefone_celular': instance.telefoneCelular,
      'email': instance.email,
    };
