// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'cliente_model.dart';
import 'enum_json_converters.dart';
import 'fatura_model.dart';
import 'imagem_observacao_model.dart';
import 'item_ordem_servico_model.dart';
import 'ordem_servico_model.dart';
import 'tipo_alvo_observacao_model.dart';
import 'usuario_model.dart';
import 'visibilidade_observacao_model.dart';

part 'observacao_model.g.dart';

/// Observacao ligada a cliente, ordem, item ou fatura.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ObservacaoModel {
  final String id;
  @JsonKey(name: 'tipo_alvo')
  @TipoAlvoObservacaoModelConverter()
  final TipoAlvoObservacaoModel tipoAlvo;
  @JsonKey(name: 'ordem_servico_id')
  final String? ordemServicoId;
  @JsonKey(name: 'item_ordem_servico_id')
  final String? itemOrdemServicoId;
  @JsonKey(name: 'cliente_id')
  final String? clienteId;
  @JsonKey(name: 'fatura_id')
  final String? faturaId;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  @VisibilidadeObservacaoModelConverter()
  final VisibilidadeObservacaoModel visibilidade;
  final String? titulo;
  final String conteudo;
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
  @JsonKey(name: 'criado_por', includeToJson: false)
  final UsuarioModel? criadoPor;
  @JsonKey(name: 'atualizado_por', includeToJson: false)
  final UsuarioModel? atualizadoPor;
  @JsonKey(includeToJson: false)
  final List<ImagemObservacaoModel>? imagens;

  const ObservacaoModel({
    required this.id,
    required this.tipoAlvo,
    this.ordemServicoId,
    this.itemOrdemServicoId,
    this.clienteId,
    this.faturaId,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.visibilidade,
    this.titulo,
    required this.conteudo,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.ordemServico,
    this.itemOrdemServico,
    this.cliente,
    this.fatura,
    this.criadoPor,
    this.atualizadoPor,
    this.imagens,
  }) : assert(
          (ordemServicoId == null ? 0 : 1) +
                  (itemOrdemServicoId == null ? 0 : 1) +
                  (clienteId == null ? 0 : 1) +
                  (faturaId == null ? 0 : 1) ==
              1,
          'Observacao deve possuir exatamente um alvo.',
        );

  factory ObservacaoModel.fromJson(Map<String, dynamic> json) =>
      _$ObservacaoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ObservacaoModelToJson(this);

  ObservacaoModel copyWith({
    String? id,
    TipoAlvoObservacaoModel? tipoAlvo,
    String? ordemServicoId,
    String? itemOrdemServicoId,
    String? clienteId,
    String? faturaId,
    String? criadoPorId,
    String? atualizadoPorId,
    VisibilidadeObservacaoModel? visibilidade,
    String? titulo,
    String? conteudo,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    ItemOrdemServicoModel? itemOrdemServico,
    ClienteModel? cliente,
    FaturaModel? fatura,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ImagemObservacaoModel>? imagens,
  }) =>
      ObservacaoModel(
        id: id ?? this.id,
        tipoAlvo: tipoAlvo ?? this.tipoAlvo,
        ordemServicoId: ordemServicoId ?? this.ordemServicoId,
        itemOrdemServicoId: itemOrdemServicoId ?? this.itemOrdemServicoId,
        clienteId: clienteId ?? this.clienteId,
        faturaId: faturaId ?? this.faturaId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        visibilidade: visibilidade ?? this.visibilidade,
        titulo: titulo ?? this.titulo,
        conteudo: conteudo ?? this.conteudo,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        ordemServico: ordemServico ?? this.ordemServico,
        itemOrdemServico: itemOrdemServico ?? this.itemOrdemServico,
        cliente: cliente ?? this.cliente,
        fatura: fatura ?? this.fatura,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
        imagens: imagens ?? this.imagens,
      );
}
