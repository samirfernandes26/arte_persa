// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intencao_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntencaoUploadModel _$IntencaoUploadModelFromJson(Map<String, dynamic> json) =>
    IntencaoUploadModel(
      id: json['id'] as String,
      chaveS3: json['chave_s3'] as String,
      bucket: json['bucket'] as String,
      tipoDestino: json['tipo_destino'] as String,
      nomeArquivo: json['nome_arquivo'] as String,
      tipoMime: json['tipo_mime'] as String,
      ordemServicoId: json['ordem_servico_id'] as String?,
      itemOrdemServicoId: json['item_ordem_servico_id'] as String?,
      clienteId: json['cliente_id'] as String?,
      faturaId: json['fatura_id'] as String?,
      usuarioSolicitanteId: json['usuario_solicitante_id'] as String?,
      confirmadoEm: json['confirmado_em'] == null
          ? null
          : DateTime.parse(json['confirmado_em'] as String),
      expiraEm: DateTime.parse(json['expira_em'] as String),
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
      usuarioSolicitante: json['usuario_solicitante'] == null
          ? null
          : UsuarioModel.fromJson(
              json['usuario_solicitante'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntencaoUploadModelToJson(
        IntencaoUploadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chave_s3': instance.chaveS3,
      'bucket': instance.bucket,
      'tipo_destino': instance.tipoDestino,
      'nome_arquivo': instance.nomeArquivo,
      'tipo_mime': instance.tipoMime,
      if (instance.ordemServicoId case final value?) 'ordem_servico_id': value,
      if (instance.itemOrdemServicoId case final value?)
        'item_ordem_servico_id': value,
      if (instance.clienteId case final value?) 'cliente_id': value,
      if (instance.faturaId case final value?) 'fatura_id': value,
      if (instance.usuarioSolicitanteId case final value?)
        'usuario_solicitante_id': value,
      if (instance.confirmadoEm?.toIso8601String() case final value?)
        'confirmado_em': value,
      'expira_em': instance.expiraEm.toIso8601String(),
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
