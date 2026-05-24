// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordem_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdemServicoModel _$OrdemServicoModelFromJson(Map<String, dynamic> json) =>
    OrdemServicoModel(
      id: json['id'] as String,
      codigo: json['codigo'] as String,
      clienteId: json['cliente_id'] as String,
      criadoPorId: json['criado_por_id'] as String,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      responsavelId: json['responsavel_id'] as String?,
      aprovadoPorDescontoId: json['aprovado_por_desconto_id'] as String?,
      status: const StatusOrdemServicoModelConverter().fromJson(json['status']),
      canalEntrada: const CanalEntradaOrdemServicoModelConverter()
          .fromJson(json['canal_entrada']),
      agendadaColetaEm: json['agendada_coleta_em'] == null
          ? null
          : DateTime.parse(json['agendada_coleta_em'] as String),
      agendadaEntregaEm: json['agendada_entrega_em'] == null
          ? null
          : DateTime.parse(json['agendada_entrega_em'] as String),
      iniciadaEm: json['iniciada_em'] == null
          ? null
          : DateTime.parse(json['iniciada_em'] as String),
      finalizadaEm: json['finalizada_em'] == null
          ? null
          : DateTime.parse(json['finalizada_em'] as String),
      canceladaEm: json['cancelada_em'] == null
          ? null
          : DateTime.parse(json['cancelada_em'] as String),
      snapshotEnderecoColeta:
          json['snapshot_endereco_coleta'] as Map<String, dynamic>?,
      snapshotEnderecoEntrega:
          json['snapshot_endereco_entrega'] as Map<String, dynamic>?,
      snapshotCliente: json['snapshot_cliente'] as Map<String, dynamic>?,
      snapshotPoliticaDesconto:
          json['snapshot_politica_desconto'] as Map<String, dynamic>?,
      percentualDesconto:
          const DecimalJsonConverter().fromJson(json['percentual_desconto']),
      valorDesconto:
          const DecimalJsonConverter().fromJson(json['valor_desconto']),
      valorFrete: const DecimalJsonConverter().fromJson(json['valor_frete']),
      valorSubtotal:
          const DecimalJsonConverter().fromJson(json['valor_subtotal']),
      valorTotal: const DecimalJsonConverter().fromJson(json['valor_total']),
      motivoDesconto: json['motivo_desconto'] as String?,
      observacoesInternas: json['observacoes_internas'] as String?,
      observacoesCliente: json['observacoes_cliente'] as String?,
      chaveAssinaturaCliente: json['chave_assinatura_cliente'] as String?,
      urlAssinaturaCliente: json['url_assinatura_cliente'] as String?,
      assinadaEm: json['assinada_em'] == null
          ? null
          : DateTime.parse(json['assinada_em'] as String),
      chavePdf: json['chave_pdf'] as String?,
      urlPdf: json['url_pdf'] as String?,
      ativo: json['ativo'] as bool,
      dataCriacao: DateTime.parse(json['data_criacao'] as String),
      dataAtualizacao: DateTime.parse(json['data_atualizacao'] as String),
      dataExclusao: json['data_exclusao'] == null
          ? null
          : DateTime.parse(json['data_exclusao'] as String),
      cliente: json['cliente'] == null
          ? null
          : ClienteModel.fromJson(json['cliente'] as Map<String, dynamic>),
      criadoPor: json['criado_por'] == null
          ? null
          : UsuarioModel.fromJson(json['criado_por'] as Map<String, dynamic>),
      atualizadoPor: json['atualizado_por'] == null
          ? null
          : UsuarioModel.fromJson(
              json['atualizado_por'] as Map<String, dynamic>),
      responsavel: json['responsavel'] == null
          ? null
          : UsuarioModel.fromJson(json['responsavel'] as Map<String, dynamic>),
      aprovadoPorDesconto: json['aprovado_por_desconto'] == null
          ? null
          : UsuarioModel.fromJson(
              json['aprovado_por_desconto'] as Map<String, dynamic>),
      itens: (json['itens'] as List<dynamic>?)
          ?.map(
              (e) => ItemOrdemServicoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      historicoStatus: (json['historico_status'] as List<dynamic>?)
          ?.map((e) => HistoricoStatusOrdemServicoModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      observacoes: (json['observacoes'] as List<dynamic>?)
          ?.map((e) => ObservacaoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      imagens: (json['imagens'] as List<dynamic>?)
          ?.map((e) =>
              ImagemOrdemServicoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fatura: json['fatura'] == null
          ? null
          : FaturaModel.fromJson(json['fatura'] as Map<String, dynamic>),
      intencoesUpload: (json['intencoes_upload'] as List<dynamic>?)
          ?.map((e) => IntencaoUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrdemServicoModelToJson(OrdemServicoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'codigo': instance.codigo,
      'cliente_id': instance.clienteId,
      'criado_por_id': instance.criadoPorId,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      if (instance.responsavelId case final value?) 'responsavel_id': value,
      if (instance.aprovadoPorDescontoId case final value?)
        'aprovado_por_desconto_id': value,
      if (const StatusOrdemServicoModelConverter().toJson(instance.status)
          case final value?)
        'status': value,
      if (const CanalEntradaOrdemServicoModelConverter()
              .toJson(instance.canalEntrada)
          case final value?)
        'canal_entrada': value,
      if (instance.agendadaColetaEm?.toIso8601String() case final value?)
        'agendada_coleta_em': value,
      if (instance.agendadaEntregaEm?.toIso8601String() case final value?)
        'agendada_entrega_em': value,
      if (instance.iniciadaEm?.toIso8601String() case final value?)
        'iniciada_em': value,
      if (instance.finalizadaEm?.toIso8601String() case final value?)
        'finalizada_em': value,
      if (instance.canceladaEm?.toIso8601String() case final value?)
        'cancelada_em': value,
      if (const DecimalJsonConverter().toJson(instance.percentualDesconto)
          case final value?)
        'percentual_desconto': value,
      if (const DecimalJsonConverter().toJson(instance.valorDesconto)
          case final value?)
        'valor_desconto': value,
      if (const DecimalJsonConverter().toJson(instance.valorFrete)
          case final value?)
        'valor_frete': value,
      if (const DecimalJsonConverter().toJson(instance.valorSubtotal)
          case final value?)
        'valor_subtotal': value,
      if (const DecimalJsonConverter().toJson(instance.valorTotal)
          case final value?)
        'valor_total': value,
      if (instance.motivoDesconto case final value?) 'motivo_desconto': value,
      if (instance.observacoesCliente case final value?)
        'observacoes_cliente': value,
      if (instance.chaveAssinaturaCliente case final value?)
        'chave_assinatura_cliente': value,
      if (instance.urlAssinaturaCliente case final value?)
        'url_assinatura_cliente': value,
      if (instance.assinadaEm?.toIso8601String() case final value?)
        'assinada_em': value,
      if (instance.chavePdf case final value?) 'chave_pdf': value,
      if (instance.urlPdf case final value?) 'url_pdf': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
