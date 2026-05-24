// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fatura_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaturaModel _$FaturaModelFromJson(Map<String, dynamic> json) => FaturaModel(
      id: json['id'] as String,
      ordemServicoId: json['ordem_servico_id'] as String,
      numero: json['numero'] as String,
      criadoPorId: json['criado_por_id'] as String?,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      status: const StatusFaturaModelConverter().fromJson(json['status']),
      emitidaEm: json['emitida_em'] == null
          ? null
          : DateTime.parse(json['emitida_em'] as String),
      vencimentoEm: json['vencimento_em'] == null
          ? null
          : DateTime.parse(json['vencimento_em'] as String),
      pagaEm: json['paga_em'] == null
          ? null
          : DateTime.parse(json['paga_em'] as String),
      metodoPagamento: const MetodoPagamentoModelNullableConverter()
          .fromJson(json['metodo_pagamento']),
      valorSubtotal:
          const DecimalJsonConverter().fromJson(json['valor_subtotal']),
      valorDesconto:
          const DecimalJsonConverter().fromJson(json['valor_desconto']),
      valorImpostos:
          const DecimalJsonConverter().fromJson(json['valor_impostos']),
      valorTotal: const DecimalJsonConverter().fromJson(json['valor_total']),
      observacoes: json['observacoes'] as String?,
      chavePdf: json['chave_pdf'] as String?,
      urlPdf: json['url_pdf'] as String?,
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
      observacoesRelacionadas:
          (json['observacoes_relacionadas'] as List<dynamic>?)
              ?.map((e) => ObservacaoModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      intencoesUpload: (json['intencoes_upload'] as List<dynamic>?)
          ?.map((e) => IntencaoUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FaturaModelToJson(FaturaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ordem_servico_id': instance.ordemServicoId,
      'numero': instance.numero,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      if (const StatusFaturaModelConverter().toJson(instance.status)
          case final value?)
        'status': value,
      if (instance.emitidaEm?.toIso8601String() case final value?)
        'emitida_em': value,
      if (instance.vencimentoEm?.toIso8601String() case final value?)
        'vencimento_em': value,
      if (instance.pagaEm?.toIso8601String() case final value?)
        'paga_em': value,
      if (const MetodoPagamentoModelNullableConverter()
              .toJson(instance.metodoPagamento)
          case final value?)
        'metodo_pagamento': value,
      if (const DecimalJsonConverter().toJson(instance.valorSubtotal)
          case final value?)
        'valor_subtotal': value,
      if (const DecimalJsonConverter().toJson(instance.valorDesconto)
          case final value?)
        'valor_desconto': value,
      if (const DecimalJsonConverter().toJson(instance.valorImpostos)
          case final value?)
        'valor_impostos': value,
      if (const DecimalJsonConverter().toJson(instance.valorTotal)
          case final value?)
        'valor_total': value,
      if (instance.observacoes case final value?) 'observacoes': value,
      if (instance.chavePdf case final value?) 'chave_pdf': value,
      if (instance.urlPdf case final value?) 'url_pdf': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
