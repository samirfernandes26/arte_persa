// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnderecoModel _$EnderecoModelFromJson(Map<String, dynamic> json) =>
    EnderecoModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      cep: json['cep'] as String,
      logradouro: json['logradouro'] as String,
      numero: json['numero'] as String,
      complemento: json['complemento'] as String,
      bairro: json['bairro'] as String,
      estado: json['estado'] as String,
      referencia: json['referencia'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EnderecoModelToJson(EnderecoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'cep': instance.cep,
      'logradouro': instance.logradouro,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'estado': instance.estado,
      'referencia': instance.referencia,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
