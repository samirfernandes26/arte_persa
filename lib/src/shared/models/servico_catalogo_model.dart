// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'decimal_json_converter.dart';
import 'enum_json_converters.dart';
import 'servico_executado_item_model.dart';
import 'unidade_cobranca_servico_model.dart';
import 'usuario_model.dart';

part 'servico_catalogo_model.g.dart';

/// Servico comercializado no catalogo mestre da operacao.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ServicoCatalogoModel {
  final String id;
  final String nome;
  final String? descricao;
  final String? categoria;
  @JsonKey(name: 'preco_base')
  @DecimalJsonConverter()
  final String precoBase;
  @JsonKey(name: 'unidade_cobranca')
  @UnidadeCobrancaServicoModelConverter()
  final UnidadeCobrancaServicoModel unidadeCobranca;
  @JsonKey(name: 'prazo_medio_dias')
  final int? prazoMedioDias;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(name: 'criado_por', includeToJson: false)
  final UsuarioModel? criadoPor;
  @JsonKey(name: 'atualizado_por', includeToJson: false)
  final UsuarioModel? atualizadoPor;
  @JsonKey(name: 'servicos_executados_item', includeToJson: false)
  final List<ServicoExecutadoItemModel>? servicosExecutadosItem;

  const ServicoCatalogoModel({
    required this.id,
    required this.nome,
    this.descricao,
    this.categoria,
    required this.precoBase,
    required this.unidadeCobranca,
    this.prazoMedioDias,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.criadoPor,
    this.atualizadoPor,
    this.servicosExecutadosItem,
  });

  factory ServicoCatalogoModel.fromJson(Map<String, dynamic> json) =>
      _$ServicoCatalogoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServicoCatalogoModelToJson(this);

  ServicoCatalogoModel copyWith({
    String? id,
    String? nome,
    String? descricao,
    String? categoria,
    String? precoBase,
    UnidadeCobrancaServicoModel? unidadeCobranca,
    int? prazoMedioDias,
    String? criadoPorId,
    String? atualizadoPorId,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ServicoExecutadoItemModel>? servicosExecutadosItem,
  }) =>
      ServicoCatalogoModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        categoria: categoria ?? this.categoria,
        precoBase: precoBase ?? this.precoBase,
        unidadeCobranca: unidadeCobranca ?? this.unidadeCobranca,
        prazoMedioDias: prazoMedioDias ?? this.prazoMedioDias,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
        servicosExecutadosItem:
            servicosExecutadosItem ?? this.servicosExecutadosItem,
      );
}
