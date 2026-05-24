// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico_executado_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicoExecutadoItemModel _$ServicoExecutadoItemModelFromJson(
        Map<String, dynamic> json) =>
    ServicoExecutadoItemModel(
      id: json['id'] as String,
      itemOrdemServicoId: json['item_ordem_servico_id'] as String,
      servicoCatalogoId: json['servico_catalogo_id'] as String?,
      nomeServicoSnapshot: json['nome_servico_snapshot'] as String,
      categoriaServicoSnapshot: json['categoria_servico_snapshot'] as String?,
      unidadeCobrancaSnapshot: const UnidadeCobrancaServicoModelConverter()
          .fromJson(json['unidade_cobranca_snapshot']),
      valorUnitarioSnapshot: const DecimalJsonConverter()
          .fromJson(json['valor_unitario_snapshot']),
      quantidade: const DecimalJsonConverter().fromJson(json['quantidade']),
      valorDesconto:
          const DecimalJsonConverter().fromJson(json['valor_desconto']),
      valorTotal: const DecimalJsonConverter().fromJson(json['valor_total']),
      observacoes: json['observacoes'] as String?,
      ativo: json['ativo'] as bool,
      dataCriacao: DateTime.parse(json['data_criacao'] as String),
      dataAtualizacao: DateTime.parse(json['data_atualizacao'] as String),
      dataExclusao: json['data_exclusao'] == null
          ? null
          : DateTime.parse(json['data_exclusao'] as String),
      itemOrdemServico: json['item_ordem_servico'] == null
          ? null
          : ItemOrdemServicoModel.fromJson(
              json['item_ordem_servico'] as Map<String, dynamic>),
      servicoCatalogo: json['servico_catalogo'] == null
          ? null
          : ServicoCatalogoModel.fromJson(
              json['servico_catalogo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServicoExecutadoItemModelToJson(
        ServicoExecutadoItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_ordem_servico_id': instance.itemOrdemServicoId,
      if (instance.servicoCatalogoId case final value?)
        'servico_catalogo_id': value,
      'nome_servico_snapshot': instance.nomeServicoSnapshot,
      if (instance.categoriaServicoSnapshot case final value?)
        'categoria_servico_snapshot': value,
      if (const UnidadeCobrancaServicoModelConverter()
              .toJson(instance.unidadeCobrancaSnapshot)
          case final value?)
        'unidade_cobranca_snapshot': value,
      if (const DecimalJsonConverter().toJson(instance.valorUnitarioSnapshot)
          case final value?)
        'valor_unitario_snapshot': value,
      if (const DecimalJsonConverter().toJson(instance.quantidade)
          case final value?)
        'quantidade': value,
      if (const DecimalJsonConverter().toJson(instance.valorDesconto)
          case final value?)
        'valor_desconto': value,
      if (const DecimalJsonConverter().toJson(instance.valorTotal)
          case final value?)
        'valor_total': value,
      if (instance.observacoes case final value?) 'observacoes': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
