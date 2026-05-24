// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) => ClienteModel(
      id: json['id'] as String,
      tipoPessoa:
          const TipoPessoaClienteModelConverter().fromJson(json['tipo_pessoa']),
      documento: json['documento'] as String?,
      nomeRazaoSocial: json['nome_razao_social'] as String,
      nomeFantasiaApelido: json['nome_fantasia_apelido'] as String?,
      emailPrincipal: json['email_principal'] as String?,
      telefonePrincipal: json['telefone_principal'] as String?,
      observacoesInternas: json['observacoes_internas'] as String?,
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
      contatos: (json['contatos'] as List<dynamic>?)
          ?.map((e) => ContatoClienteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      enderecos: (json['enderecos'] as List<dynamic>?)
          ?.map((e) => EnderecoClienteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      arquivos: (json['arquivos'] as List<dynamic>?)
          ?.map((e) => ArquivoClienteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ordensServico: (json['ordens_servico'] as List<dynamic>?)
          ?.map((e) => OrdemServicoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      observacoes: (json['observacoes'] as List<dynamic>?)
          ?.map((e) => ObservacaoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      intencoesUpload: (json['intencoes_upload'] as List<dynamic>?)
          ?.map((e) => IntencaoUploadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      if (const TipoPessoaClienteModelConverter().toJson(instance.tipoPessoa)
          case final value?)
        'tipo_pessoa': value,
      'nome_razao_social': instance.nomeRazaoSocial,
      if (instance.nomeFantasiaApelido case final value?)
        'nome_fantasia_apelido': value,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
