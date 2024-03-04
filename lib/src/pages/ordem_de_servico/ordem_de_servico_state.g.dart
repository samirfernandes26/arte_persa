// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_de_servico_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdemDeServicoForm _$OrdemDeServicoFormFromJson(Map<String, dynamic> json) =>
    OrdemDeServicoForm(
      id: json['id'] as String?,
      clienteId: json['cliente_id'] as String?,
      numeroPedido: _$JsonConverterFromJson<String, int>(
          json['numero_pedido'], const StringToIntConverter().fromJson),
      itens: (json['itens'] as List<dynamic>?)
          ?.map((e) => ItemForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      fatura: (json['fatura'] as List<dynamic>?)
          ?.map((e) => FaturamentoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pathAssinaturaCliente: json['path_assinatura_cliente'] == null
          ? null
          : ImageModel.fromJson(
              json['path_assinatura_cliente'] as Map<String, dynamic>),
      pathFotoAltorizacaoCliente: json['path_foto_altorizacao_cliente'] == null
          ? null
          : ImageModel.fromJson(
              json['path_foto_altorizacao_cliente'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrdemDeServicoFormToJson(OrdemDeServicoForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente_id': instance.clienteId,
      'numero_pedido': _$JsonConverterToJson<String, int>(
          instance.numeroPedido, const StringToIntConverter().toJson),
      'itens': instance.itens,
      'fatura': instance.fatura,
      'path_assinatura_cliente': instance.pathAssinaturaCliente,
      'path_foto_altorizacao_cliente': instance.pathFotoAltorizacaoCliente,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

ItemForm _$ItemFormFromJson(Map<String, dynamic> json) => ItemForm(
      tipoIdetem: json['tipo_item'] as String?,
      nomeDoItem: json['nome_do_item'] as String?,
      comprimento: const StringToDoubleConverter()
          .fromJson(json['comprimento'] as String?),
      largura:
          const StringToDoubleConverter().fromJson(json['largura'] as String?),
      observacoes: (json['observacoes'] as List<dynamic>?)
          ?.map((e) => ObservacaoForm.fromJson(e as Map<String, dynamic>))
          .toList(),
      fotoProduto: json['foto_produto'] == null
          ? null
          : ImageModel.fromJson(json['foto_produto'] as Map<String, dynamic>),
      servicos: (json['servicos'] as List<dynamic>?)
          ?.map((e) => ServicoModel.fromJson(e as Map<String, dynamic>))
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
      'servicos': instance.servicos,
      'total': const StringToDoubleConverter().toJson(instance.total),
    };

ObservacaoForm _$ObservacaoFormFromJson(Map<String, dynamic> json) =>
    ObservacaoForm(
      id: json['id'] as String?,
      observacao: json['observacao'] as String?,
      image: json['image'] == null
          ? null
          : ImageModel.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ObservacaoFormToJson(ObservacaoForm instance) =>
    <String, dynamic>{
      'id': instance.id,
      'observacao': instance.observacao,
      'image': instance.image,
    };
