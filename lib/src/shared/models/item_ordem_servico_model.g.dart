// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_ordem_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOrdemServicoModel _$ItemOrdemServicoModelFromJson(
        Map<String, dynamic> json) =>
    ItemOrdemServicoModel(
      id: json['id'] as String,
      ordemServicoId: json['ordem_servico_id'] as String,
      criadoPorId: json['criado_por_id'] as String?,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      descricao: json['descricao'] as String,
      categoria:
          const CategoriaItemModelConverter().fromJson(json['categoria']),
      material:
          const MaterialItemModelNullableConverter().fromJson(json['material']),
      quantidade: (json['quantidade'] as num).toInt(),
      larguraCm:
          const DecimalNullableJsonConverter().fromJson(json['largura_cm']),
      alturaCm:
          const DecimalNullableJsonConverter().fromJson(json['altura_cm']),
      profundidadeCm: const DecimalNullableJsonConverter()
          .fromJson(json['profundidade_cm']),
      areaM2: const DecimalNullableJsonConverter().fromJson(json['area_m2']),
      valorDeclarado: const DecimalNullableJsonConverter()
          .fromJson(json['valor_declarado']),
      estadoAtual: json['estado_atual'] as String?,
      cuidadosEspeciais: json['cuidados_especiais'] as String?,
      valorUnitarioBase:
          const DecimalJsonConverter().fromJson(json['valor_unitario_base']),
      valorUnitarioDesconto: const DecimalJsonConverter()
          .fromJson(json['valor_unitario_desconto']),
      valorUnitarioFinal:
          const DecimalJsonConverter().fromJson(json['valor_unitario_final']),
      valorTotalBruto:
          const DecimalJsonConverter().fromJson(json['valor_total_bruto']),
      valorTotalDesconto:
          const DecimalJsonConverter().fromJson(json['valor_total_desconto']),
      valorTotalFinal:
          const DecimalJsonConverter().fromJson(json['valor_total_final']),
      chaveFotoInicial: json['chave_foto_inicial'] as String?,
      urlFotoInicial: json['url_foto_inicial'] as String?,
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
      criadoPor: json['criado_por'] == null
          ? null
          : UsuarioModel.fromJson(json['criado_por'] as Map<String, dynamic>),
      atualizadoPor: json['atualizado_por'] == null
          ? null
          : UsuarioModel.fromJson(
              json['atualizado_por'] as Map<String, dynamic>),
      servicosExecutados: (json['servicos_executados'] as List<dynamic>?)
          ?.map((e) =>
              ServicoExecutadoItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      observacoes: (json['observacoes'] as List<dynamic>?)
          ?.map((e) => ObservacaoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      intencoesUpload: (json['intencoes_upload'] as List<dynamic>?)
          ?.map((e) => IntencaoUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemOrdemServicoModelToJson(
        ItemOrdemServicoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ordem_servico_id': instance.ordemServicoId,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      'descricao': instance.descricao,
      if (const CategoriaItemModelConverter().toJson(instance.categoria)
          case final value?)
        'categoria': value,
      if (const MaterialItemModelNullableConverter().toJson(instance.material)
          case final value?)
        'material': value,
      'quantidade': instance.quantidade,
      if (const DecimalNullableJsonConverter().toJson(instance.larguraCm)
          case final value?)
        'largura_cm': value,
      if (const DecimalNullableJsonConverter().toJson(instance.alturaCm)
          case final value?)
        'altura_cm': value,
      if (const DecimalNullableJsonConverter().toJson(instance.profundidadeCm)
          case final value?)
        'profundidade_cm': value,
      if (const DecimalNullableJsonConverter().toJson(instance.areaM2)
          case final value?)
        'area_m2': value,
      if (const DecimalNullableJsonConverter().toJson(instance.valorDeclarado)
          case final value?)
        'valor_declarado': value,
      if (instance.estadoAtual case final value?) 'estado_atual': value,
      if (instance.cuidadosEspeciais case final value?)
        'cuidados_especiais': value,
      if (const DecimalJsonConverter().toJson(instance.valorUnitarioBase)
          case final value?)
        'valor_unitario_base': value,
      if (const DecimalJsonConverter().toJson(instance.valorUnitarioDesconto)
          case final value?)
        'valor_unitario_desconto': value,
      if (const DecimalJsonConverter().toJson(instance.valorUnitarioFinal)
          case final value?)
        'valor_unitario_final': value,
      if (const DecimalJsonConverter().toJson(instance.valorTotalBruto)
          case final value?)
        'valor_total_bruto': value,
      if (const DecimalJsonConverter().toJson(instance.valorTotalDesconto)
          case final value?)
        'valor_total_desconto': value,
      if (const DecimalJsonConverter().toJson(instance.valorTotalFinal)
          case final value?)
        'valor_total_final': value,
      if (instance.chaveFotoInicial case final value?)
        'chave_foto_inicial': value,
      if (instance.urlFotoInicial case final value?) 'url_foto_inicial': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
