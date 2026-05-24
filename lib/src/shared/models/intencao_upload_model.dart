// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'cliente_model.dart';
import 'fatura_model.dart';
import 'item_ordem_servico_model.dart';
import 'ordem_servico_model.dart';
import 'usuario_model.dart';

part 'intencao_upload_model.g.dart';

/// Intencao de upload pre-assinado para arquivos enviados ao bucket.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class IntencaoUploadModel {
  final String id;
  @JsonKey(name: 'chave_s3')
  final String chaveS3;
  final String bucket;
  @JsonKey(name: 'tipo_destino')
  final String tipoDestino;
  @JsonKey(name: 'nome_arquivo')
  final String nomeArquivo;
  @JsonKey(name: 'tipo_mime')
  final String tipoMime;
  @JsonKey(name: 'ordem_servico_id')
  final String? ordemServicoId;
  @JsonKey(name: 'item_ordem_servico_id')
  final String? itemOrdemServicoId;
  @JsonKey(name: 'cliente_id')
  final String? clienteId;
  @JsonKey(name: 'fatura_id')
  final String? faturaId;
  @JsonKey(name: 'usuario_solicitante_id')
  final String? usuarioSolicitanteId;
  @JsonKey(name: 'confirmado_em')
  final DateTime? confirmadoEm;
  @JsonKey(name: 'expira_em')
  final DateTime expiraEm;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(name: 'ordem_servico', includeToJson: false)
  final OrdemServicoModel? ordemServico;
  @JsonKey(name: 'item_ordem_servico', includeToJson: false)
  final ItemOrdemServicoModel? itemOrdemServico;
  @JsonKey(includeToJson: false)
  final ClienteModel? cliente;
  @JsonKey(includeToJson: false)
  final FaturaModel? fatura;
  @JsonKey(name: 'usuario_solicitante', includeToJson: false)
  final UsuarioModel? usuarioSolicitante;

  const IntencaoUploadModel({
    required this.id,
    required this.chaveS3,
    required this.bucket,
    required this.tipoDestino,
    required this.nomeArquivo,
    required this.tipoMime,
    this.ordemServicoId,
    this.itemOrdemServicoId,
    this.clienteId,
    this.faturaId,
    this.usuarioSolicitanteId,
    this.confirmadoEm,
    required this.expiraEm,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.ordemServico,
    this.itemOrdemServico,
    this.cliente,
    this.fatura,
    this.usuarioSolicitante,
  });

  factory IntencaoUploadModel.fromJson(Map<String, dynamic> json) =>
      _$IntencaoUploadModelFromJson(json);

  Map<String, dynamic> toJson() => _$IntencaoUploadModelToJson(this);

  IntencaoUploadModel copyWith({
    String? id,
    String? chaveS3,
    String? bucket,
    String? tipoDestino,
    String? nomeArquivo,
    String? tipoMime,
    String? ordemServicoId,
    String? itemOrdemServicoId,
    String? clienteId,
    String? faturaId,
    String? usuarioSolicitanteId,
    DateTime? confirmadoEm,
    DateTime? expiraEm,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    ItemOrdemServicoModel? itemOrdemServico,
    ClienteModel? cliente,
    FaturaModel? fatura,
    UsuarioModel? usuarioSolicitante,
  }) =>
      IntencaoUploadModel(
        id: id ?? this.id,
        chaveS3: chaveS3 ?? this.chaveS3,
        bucket: bucket ?? this.bucket,
        tipoDestino: tipoDestino ?? this.tipoDestino,
        nomeArquivo: nomeArquivo ?? this.nomeArquivo,
        tipoMime: tipoMime ?? this.tipoMime,
        ordemServicoId: ordemServicoId ?? this.ordemServicoId,
        itemOrdemServicoId: itemOrdemServicoId ?? this.itemOrdemServicoId,
        clienteId: clienteId ?? this.clienteId,
        faturaId: faturaId ?? this.faturaId,
        usuarioSolicitanteId: usuarioSolicitanteId ?? this.usuarioSolicitanteId,
        confirmadoEm: confirmadoEm ?? this.confirmadoEm,
        expiraEm: expiraEm ?? this.expiraEm,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        ordemServico: ordemServico ?? this.ordemServico,
        itemOrdemServico: itemOrdemServico ?? this.itemOrdemServico,
        cliente: cliente ?? this.cliente,
        fatura: fatura ?? this.fatura,
        usuarioSolicitante: usuarioSolicitante ?? this.usuarioSolicitante,
      );
}
