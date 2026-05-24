// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_cliente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContatoClienteModel _$ContatoClienteModelFromJson(Map<String, dynamic> json) =>
    ContatoClienteModel(
      id: json['id'] as String,
      clienteId: json['cliente_id'] as String,
      criadoPorId: json['criado_por_id'] as String?,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      nome: json['nome'] as String,
      setor: json['setor'] as String?,
      cargo: json['cargo'] as String?,
      tipoContato: const TipoContatoClienteModelConverter()
          .fromJson(json['tipo_contato']),
      valor: json['valor'] as String,
      principal: json['principal'] as bool,
      observacoes: json['observacoes'] as String?,
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
    );

Map<String, dynamic> _$ContatoClienteModelToJson(
        ContatoClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente_id': instance.clienteId,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      'nome': instance.nome,
      if (instance.setor case final value?) 'setor': value,
      if (instance.cargo case final value?) 'cargo': value,
      if (const TipoContatoClienteModelConverter().toJson(instance.tipoContato)
          case final value?)
        'tipo_contato': value,
      'valor': instance.valor,
      'principal': instance.principal,
      if (instance.observacoes case final value?) 'observacoes': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
