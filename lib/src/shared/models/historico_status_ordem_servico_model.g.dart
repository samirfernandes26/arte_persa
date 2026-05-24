// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_status_ordem_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricoStatusOrdemServicoModel _$HistoricoStatusOrdemServicoModelFromJson(
        Map<String, dynamic> json) =>
    HistoricoStatusOrdemServicoModel(
      id: json['id'] as String,
      ordemServicoId: json['ordem_servico_id'] as String,
      usuarioId: json['usuario_id'] as String,
      statusOrigem: const StatusOrdemServicoModelNullableConverter()
          .fromJson(json['status_origem']),
      statusDestino: const StatusOrdemServicoModelConverter()
          .fromJson(json['status_destino']),
      motivo: json['motivo'] as String?,
      metadados: json['metadados'] as Map<String, dynamic>?,
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
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(json['usuario'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoricoStatusOrdemServicoModelToJson(
        HistoricoStatusOrdemServicoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ordem_servico_id': instance.ordemServicoId,
      'usuario_id': instance.usuarioId,
      if (const StatusOrdemServicoModelNullableConverter()
              .toJson(instance.statusOrigem)
          case final value?)
        'status_origem': value,
      if (const StatusOrdemServicoModelConverter()
              .toJson(instance.statusDestino)
          case final value?)
        'status_destino': value,
      if (instance.motivo case final value?) 'motivo': value,
      if (instance.metadados case final value?) 'metadados': value,
      'ativo': instance.ativo,
      'data_criacao': instance.dataCriacao.toIso8601String(),
      'data_atualizacao': instance.dataAtualizacao.toIso8601String(),
      if (instance.dataExclusao?.toIso8601String() case final value?)
        'data_exclusao': value,
    };
