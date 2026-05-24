// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'decimal_json_converter.dart';
import 'enum_json_converters.dart';
import 'intencao_upload_model.dart';
import 'metodo_pagamento_model.dart';
import 'observacao_model.dart';
import 'ordem_servico_model.dart';
import 'status_fatura_model.dart';
import 'usuario_model.dart';

part 'fatura_model.g.dart';

/// Documento financeiro vinculado a uma ordem de servico.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class FaturaModel {
  final String id;
  @JsonKey(name: 'ordem_servico_id')
  final String ordemServicoId;
  final String numero;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  @StatusFaturaModelConverter()
  final StatusFaturaModel status;
  @JsonKey(name: 'emitida_em')
  final DateTime? emitidaEm;
  @JsonKey(name: 'vencimento_em')
  final DateTime? vencimentoEm;
  @JsonKey(name: 'paga_em')
  final DateTime? pagaEm;
  @JsonKey(name: 'metodo_pagamento')
  @MetodoPagamentoModelNullableConverter()
  final MetodoPagamentoModel? metodoPagamento;
  @JsonKey(name: 'valor_subtotal')
  @DecimalJsonConverter()
  final String valorSubtotal;
  @JsonKey(name: 'valor_desconto')
  @DecimalJsonConverter()
  final String valorDesconto;
  @JsonKey(name: 'valor_impostos')
  @DecimalJsonConverter()
  final String valorImpostos;
  @JsonKey(name: 'valor_total')
  @DecimalJsonConverter()
  final String valorTotal;
  final String? observacoes;
  @JsonKey(name: 'chave_pdf')
  final String? chavePdf;
  @JsonKey(name: 'url_pdf')
  final String? urlPdf;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(name: 'ordem_servico', includeToJson: false)
  final OrdemServicoModel? ordemServico;
  @JsonKey(name: 'criado_por', includeToJson: false)
  final UsuarioModel? criadoPor;
  @JsonKey(name: 'atualizado_por', includeToJson: false)
  final UsuarioModel? atualizadoPor;
  @JsonKey(name: 'observacoes_relacionadas', includeToJson: false)
  final List<ObservacaoModel>? observacoesRelacionadas;
  @JsonKey(name: 'intencoes_upload', includeToJson: false)
  final List<IntencaoUploadModel>? intencoesUpload;

  const FaturaModel({
    required this.id,
    required this.ordemServicoId,
    required this.numero,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.status,
    this.emitidaEm,
    this.vencimentoEm,
    this.pagaEm,
    this.metodoPagamento,
    required this.valorSubtotal,
    required this.valorDesconto,
    required this.valorImpostos,
    required this.valorTotal,
    this.observacoes,
    this.chavePdf,
    this.urlPdf,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.ordemServico,
    this.criadoPor,
    this.atualizadoPor,
    this.observacoesRelacionadas,
    this.intencoesUpload,
  });

  factory FaturaModel.fromJson(Map<String, dynamic> json) =>
      _$FaturaModelFromJson(json);

  Map<String, dynamic> toJson() => _$FaturaModelToJson(this);

  FaturaModel copyWith({
    String? id,
    String? ordemServicoId,
    String? numero,
    String? criadoPorId,
    String? atualizadoPorId,
    StatusFaturaModel? status,
    DateTime? emitidaEm,
    DateTime? vencimentoEm,
    DateTime? pagaEm,
    MetodoPagamentoModel? metodoPagamento,
    String? valorSubtotal,
    String? valorDesconto,
    String? valorImpostos,
    String? valorTotal,
    String? observacoes,
    String? chavePdf,
    String? urlPdf,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ObservacaoModel>? observacoesRelacionadas,
    List<IntencaoUploadModel>? intencoesUpload,
  }) =>
      FaturaModel(
        id: id ?? this.id,
        ordemServicoId: ordemServicoId ?? this.ordemServicoId,
        numero: numero ?? this.numero,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        status: status ?? this.status,
        emitidaEm: emitidaEm ?? this.emitidaEm,
        vencimentoEm: vencimentoEm ?? this.vencimentoEm,
        pagaEm: pagaEm ?? this.pagaEm,
        metodoPagamento: metodoPagamento ?? this.metodoPagamento,
        valorSubtotal: valorSubtotal ?? this.valorSubtotal,
        valorDesconto: valorDesconto ?? this.valorDesconto,
        valorImpostos: valorImpostos ?? this.valorImpostos,
        valorTotal: valorTotal ?? this.valorTotal,
        observacoes: observacoes ?? this.observacoes,
        chavePdf: chavePdf ?? this.chavePdf,
        urlPdf: urlPdf ?? this.urlPdf,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        ordemServico: ordemServico ?? this.ordemServico,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
        observacoesRelacionadas:
            observacoesRelacionadas ?? this.observacoesRelacionadas,
        intencoesUpload: intencoesUpload ?? this.intencoesUpload,
      );
}
