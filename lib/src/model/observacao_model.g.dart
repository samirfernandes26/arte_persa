// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObservacaoModel _$ObservacaoModelFromJson(Map<String, dynamic> json) =>
    ObservacaoModel(
      id: json['id'] as String?,
      observacao: json['observacao'] as String?,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ObservacaoModelToJson(ObservacaoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'observacao': instance.observacao,
      'image': instance.image,
    };
