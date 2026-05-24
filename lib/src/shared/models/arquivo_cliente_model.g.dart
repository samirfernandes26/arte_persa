// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arquivo_cliente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArquivoClienteModel _$ArquivoClienteModelFromJson(Map<String, dynamic> json) =>
    ArquivoClienteModel(
      id: json['id'] as String,
      clienteId: json['cliente_id'] as String,
      criadoPorId: json['criado_por_id'] as String?,
      chaveS3: json['chave_s3'] as String,
      urlArquivo: json['url_arquivo'] as String?,
      nomeArquivo: json['nome_arquivo'] as String,
      tipoMime: json['tipo_mime'] as String,
      tamanhoBytes: (json['tamanho_bytes'] as num).toInt(),
      rotulo: json['rotulo'] as String?,
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
    );

Map<String, dynamic> _$ArquivoClienteModelToJson(
        ArquivoClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente_id': instance.clienteId,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      'chave_s3': instance.chaveS3,
      if (instance.urlArquivo case final value?) 'url_arquivo': value,
      'nome_arquivo': instance.nomeArquivo,
      'tipo_mime': instance.tipoMime,
      'tamanho_bytes': instance.tamanhoBytes,
      if (instance.rotulo case final value?) 'rotulo': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
