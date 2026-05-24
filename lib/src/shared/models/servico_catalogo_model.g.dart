// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servico_catalogo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicoCatalogoModel _$ServicoCatalogoModelFromJson(
        Map<String, dynamic> json) =>
    ServicoCatalogoModel(
      id: json['id'] as String,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String?,
      categoria: json['categoria'] as String?,
      precoBase: const DecimalJsonConverter().fromJson(json['preco_base']),
      unidadeCobranca: const UnidadeCobrancaServicoModelConverter()
          .fromJson(json['unidade_cobranca']),
      prazoMedioDias: (json['prazo_medio_dias'] as num?)?.toInt(),
      criadoPorId: json['criado_por_id'] as String?,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      ativo: json['ativo'] as bool,
      dataCriacao: DateTime.parse(json['data_criacao'] as String),
      dataAtualizacao: DateTime.parse(json['data_atualizacao'] as String),
      dataExclusao: json['data_exclusao'] == null
          ? null
          : DateTime.parse(json['data_exclusao'] as String),
      criadoPor: json['criado_por'] == null
          ? null
          : UsuarioModel.fromJson(json['criado_por'] as Map<String, dynamic>),
      atualizadoPor: json['atualizado_por'] == null
          ? null
          : UsuarioModel.fromJson(
              json['atualizado_por'] as Map<String, dynamic>),
      servicosExecutadosItem:
          (json['servicos_executados_item'] as List<dynamic>?)
              ?.map((e) =>
                  ServicoExecutadoItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ServicoCatalogoModelToJson(
        ServicoCatalogoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      if (instance.descricao case final value?) 'descricao': value,
      if (instance.categoria case final value?) 'categoria': value,
      if (const DecimalJsonConverter().toJson(instance.precoBase)
          case final value?)
        'preco_base': value,
      if (const UnidadeCobrancaServicoModelConverter()
              .toJson(instance.unidadeCobranca)
          case final value?)
        'unidade_cobranca': value,
      if (instance.prazoMedioDias case final value?) 'prazo_medio_dias': value,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
