// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagem_observacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagemObservacaoModel _$ImagemObservacaoModelFromJson(
        Map<String, dynamic> json) =>
    ImagemObservacaoModel(
      id: json['id'] as String,
      observacaoId: json['observacao_id'] as String,
      criadoPorId: json['criado_por_id'] as String?,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      chaveS3: json['chave_s3'] as String,
      urlArquivo: json['url_arquivo'] as String?,
      nomeArquivo: json['nome_arquivo'] as String,
      tipoMime: json['tipo_mime'] as String,
      tamanhoBytes: (json['tamanho_bytes'] as num).toInt(),
      posicao: (json['posicao'] as num).toInt(),
      ativo: json['ativo'] as bool,
      dataCriacao: DateTime.parse(json['data_criacao'] as String),
      dataAtualizacao: DateTime.parse(json['data_atualizacao'] as String),
      dataExclusao: json['data_exclusao'] == null
          ? null
          : DateTime.parse(json['data_exclusao'] as String),
      observacao: json['observacao'] == null
          ? null
          : ObservacaoModel.fromJson(
              json['observacao'] as Map<String, dynamic>),
      criadoPor: json['criado_por'] == null
          ? null
          : UsuarioModel.fromJson(json['criado_por'] as Map<String, dynamic>),
      atualizadoPor: json['atualizado_por'] == null
          ? null
          : UsuarioModel.fromJson(
              json['atualizado_por'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagemObservacaoModelToJson(
        ImagemObservacaoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'observacao_id': instance.observacaoId,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      'chave_s3': instance.chaveS3,
      if (instance.urlArquivo case final value?) 'url_arquivo': value,
      'nome_arquivo': instance.nomeArquivo,
      'tipo_mime': instance.tipoMime,
      'tamanho_bytes': instance.tamanhoBytes,
      'posicao': instance.posicao,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
