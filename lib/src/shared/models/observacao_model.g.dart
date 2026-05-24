// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObservacaoModel _$ObservacaoModelFromJson(Map<String, dynamic> json) =>
    ObservacaoModel(
      id: json['id'] as String,
      tipoAlvo:
          const TipoAlvoObservacaoModelConverter().fromJson(json['tipo_alvo']),
      ordemServicoId: json['ordem_servico_id'] as String?,
      itemOrdemServicoId: json['item_ordem_servico_id'] as String?,
      clienteId: json['cliente_id'] as String?,
      faturaId: json['fatura_id'] as String?,
      criadoPorId: json['criado_por_id'] as String?,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      visibilidade: const VisibilidadeObservacaoModelConverter()
          .fromJson(json['visibilidade']),
      titulo: json['titulo'] as String?,
      conteudo: json['conteudo'] as String,
      ativo: json['ativo'] as bool,
      dataCriacao: DateTime.parse(json['data_criacao'] as String),
      dataAtualizacao: DateTime.parse(json['data_atualizacao'] as String),
      dataExclusao: json['data_exclusao'] == null
          ? null
          : DateTime.parse(json['data_exclusao'] as String),
      ordemServico: json['ordem_servico'] == null
          ? null
          : OrdemServicoModel.fromJson(
              json['ordem_servico'] as Map<String, dynamic>),
      itemOrdemServico: json['item_ordem_servico'] == null
          ? null
          : ItemOrdemServicoModel.fromJson(
              json['item_ordem_servico'] as Map<String, dynamic>),
      cliente: json['cliente'] == null
          ? null
          : ClienteModel.fromJson(json['cliente'] as Map<String, dynamic>),
      fatura: json['fatura'] == null
          ? null
          : FaturaModel.fromJson(json['fatura'] as Map<String, dynamic>),
      criadoPor: json['criado_por'] == null
          ? null
          : UsuarioModel.fromJson(json['criado_por'] as Map<String, dynamic>),
      atualizadoPor: json['atualizado_por'] == null
          ? null
          : UsuarioModel.fromJson(
              json['atualizado_por'] as Map<String, dynamic>),
      imagens: (json['imagens'] as List<dynamic>?)
          ?.map(
              (e) => ImagemObservacaoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ObservacaoModelToJson(ObservacaoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (const TipoAlvoObservacaoModelConverter().toJson(instance.tipoAlvo)
          case final value?)
        'tipo_alvo': value,
      if (instance.ordemServicoId case final value?) 'ordem_servico_id': value,
      if (instance.itemOrdemServicoId case final value?)
        'item_ordem_servico_id': value,
      if (instance.clienteId case final value?) 'cliente_id': value,
      if (instance.faturaId case final value?) 'fatura_id': value,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      if (const VisibilidadeObservacaoModelConverter()
              .toJson(instance.visibilidade)
          case final value?)
        'visibilidade': value,
      if (instance.titulo case final value?) 'titulo': value,
      'conteudo': instance.conteudo,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
