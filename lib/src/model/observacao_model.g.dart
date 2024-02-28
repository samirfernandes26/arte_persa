// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObservacaoModel _$ObservacaoModelFromJson(Map<String, dynamic> json) =>
    ObservacaoModel(
      id: json['id'] as String?,
      observacao: json['observacao'] as String?,
      pathFotoUm: json['path_foto_um'] as String?,
      pathFotoDois: json['path_foto_dois'] as String?,
    );

Map<String, dynamic> _$ObservacaoModelToJson(ObservacaoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'observacao': instance.observacao,
      'path_foto_um': instance.pathFotoUm,
      'path_foto_dois': instance.pathFotoDois,
    };
