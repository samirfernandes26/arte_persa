// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_de_servico_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemForm _$ItemFormFromJson(Map<String, dynamic> json) => ItemForm(
      tipoIdetem: json['tipo_item'] as String?,
      nomeDoItem: json['nome_do_item'] as String?,
      comprimento: const StringToDoubleConverter()
          .fromJson(json['comprimento'] as String?),
      largura:
          const StringToDoubleConverter().fromJson(json['largura'] as String?),
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

Map<String, dynamic> _$ItemFormToJson(ItemForm instance) => <String, dynamic>{
      'tipo_item': instance.tipoIdetem,
      'nome_do_item': instance.nomeDoItem,
      'comprimento':
          const StringToDoubleConverter().toJson(instance.comprimento),
      'largura': const StringToDoubleConverter().toJson(instance.largura),
      'foto_produto': instance.fotoProduto,
      'observacoes': instance.observacoes,
      'servicos_ids': instance.servicosIds,
      'total': const StringToDoubleConverter().toJson(instance.total),
    };
