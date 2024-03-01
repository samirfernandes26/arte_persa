// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      tipoIdetem: json['tipo_item'] as String,
      nomeDoItem: json['nome_do_item'] as String,
      comprimento: (json['comprimento'] as num).toDouble(),
      largura: (json['largura'] as num).toDouble(),
      observacoes: (json['observacoes'] as List<dynamic>?)
          ?.map((e) => ObservacaoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fotoProduto: json['foto_produto'] == null
          ? null
          : ImageModel.fromJson(json['foto_produto'] as Map<String, dynamic>),
      servicosIds: (json['servicos_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      total: const StringToDoubleConverter().fromJson(json['total'] as String?),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'tipo_item': instance.tipoIdetem,
      'nome_do_item': instance.nomeDoItem,
      'comprimento': instance.comprimento,
      'largura': instance.largura,
      'foto_produto': instance.fotoProduto,
      'observacoes': instance.observacoes,
      'servicos_ids': instance.servicosIds,
      'total': const StringToDoubleConverter().toJson(instance.total),
    };
