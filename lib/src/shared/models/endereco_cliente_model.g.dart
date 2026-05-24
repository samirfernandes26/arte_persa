// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_cliente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnderecoClienteModel _$EnderecoClienteModelFromJson(
        Map<String, dynamic> json) =>
    EnderecoClienteModel(
      id: json['id'] as String,
      clienteId: json['cliente_id'] as String,
      criadoPorId: json['criado_por_id'] as String?,
      atualizadoPorId: json['atualizado_por_id'] as String?,
      tipoEndereco: const TipoEnderecoClienteModelConverter()
          .fromJson(json['tipo_endereco']),
      rotulo: json['rotulo'] as String?,
      destinatario: json['destinatario'] as String?,
      cep: json['cep'] as String?,
      logradouro: json['logradouro'] as String,
      numero: json['numero'] as String?,
      complemento: json['complemento'] as String?,
      bairro: json['bairro'] as String?,
      cidade: json['cidade'] as String,
      estado: json['estado'] as String,
      pais: json['pais'] as String,
      referencia: json['referencia'] as String?,
      principal: json['principal'] as bool,
      latitude: const DecimalNullableJsonConverter().fromJson(json['latitude']),
      longitude:
          const DecimalNullableJsonConverter().fromJson(json['longitude']),
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

Map<String, dynamic> _$EnderecoClienteModelToJson(
        EnderecoClienteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cliente_id': instance.clienteId,
      if (instance.criadoPorId case final value?) 'criado_por_id': value,
      if (instance.atualizadoPorId case final value?)
        'atualizado_por_id': value,
      if (const TipoEnderecoClienteModelConverter()
              .toJson(instance.tipoEndereco)
          case final value?)
        'tipo_endereco': value,
      if (instance.rotulo case final value?) 'rotulo': value,
      if (instance.destinatario case final value?) 'destinatario': value,
      if (instance.cep case final value?) 'cep': value,
      'logradouro': instance.logradouro,
      if (instance.numero case final value?) 'numero': value,
      if (instance.complemento case final value?) 'complemento': value,
      if (instance.bairro case final value?) 'bairro': value,
      'cidade': instance.cidade,
      'estado': instance.estado,
      'pais': instance.pais,
      if (instance.referencia case final value?) 'referencia': value,
      'principal': instance.principal,
      if (const DecimalNullableJsonConverter().toJson(instance.latitude)
          case final value?)
        'latitude': value,
      if (const DecimalNullableJsonConverter().toJson(instance.longitude)
          case final value?)
        'longitude': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
