// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'enum_json_converters.dart';
import 'ordem_servico_model.dart';
import 'status_ordem_servico_model.dart';
import 'usuario_model.dart';

part 'historico_status_ordem_servico_model.g.dart';

/// Registro de transicao de status de uma ordem de servico.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class HistoricoStatusOrdemServicoModel {
  final String id;
  @JsonKey(name: 'ordem_servico_id')
  final String ordemServicoId;
  @JsonKey(name: 'usuario_id')
  final String usuarioId;
  @JsonKey(name: 'status_origem')
  @StatusOrdemServicoModelNullableConverter()
  final StatusOrdemServicoModel? statusOrigem;
  @JsonKey(name: 'status_destino')
  @StatusOrdemServicoModelConverter()
  final StatusOrdemServicoModel statusDestino;
  final String? motivo;
  final Map<String, dynamic>? metadados;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(name: 'ordem_servico', includeToJson: false)
  final OrdemServicoModel? ordemServico;
  @JsonKey(includeToJson: false)
  final UsuarioModel? usuario;

  const HistoricoStatusOrdemServicoModel({
    required this.id,
    required this.ordemServicoId,
    required this.usuarioId,
    this.statusOrigem,
    required this.statusDestino,
    this.motivo,
    this.metadados,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.ordemServico,
    this.usuario,
  });

  factory HistoricoStatusOrdemServicoModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$HistoricoStatusOrdemServicoModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HistoricoStatusOrdemServicoModelToJson(this);

  HistoricoStatusOrdemServicoModel copyWith({
    String? id,
    String? ordemServicoId,
    String? usuarioId,
    StatusOrdemServicoModel? statusOrigem,
    StatusOrdemServicoModel? statusDestino,
    String? motivo,
    Map<String, dynamic>? metadados,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    UsuarioModel? usuario,
  }) =>
      HistoricoStatusOrdemServicoModel(
        id: id ?? this.id,
        ordemServicoId: ordemServicoId ?? this.ordemServicoId,
        usuarioId: usuarioId ?? this.usuarioId,
        statusOrigem: statusOrigem ?? this.statusOrigem,
        statusDestino: statusDestino ?? this.statusDestino,
        motivo: motivo ?? this.motivo,
        metadados: metadados ?? this.metadados,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        ordemServico: ordemServico ?? this.ordemServico,
        usuario: usuario ?? this.usuario,
      );
}
