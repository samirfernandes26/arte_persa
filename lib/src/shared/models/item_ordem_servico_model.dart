// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'categoria_item_model.dart';
import 'decimal_json_converter.dart';
import 'enum_json_converters.dart';
import 'intencao_upload_model.dart';
import 'material_item_model.dart';
import 'observacao_model.dart';
import 'ordem_servico_model.dart';
import 'servico_executado_item_model.dart';
import 'usuario_model.dart';

part 'item_ordem_servico_model.g.dart';

/// Item fisico recebido para execucao dentro de uma ordem de servico.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ItemOrdemServicoModel {
  final String id;
  @JsonKey(name: 'ordem_servico_id')
  final String ordemServicoId;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  final String descricao;
  @CategoriaItemModelConverter()
  final CategoriaItemModel categoria;
  @MaterialItemModelNullableConverter()
  final MaterialItemModel? material;
  final int quantidade;
  @JsonKey(name: 'largura_cm')
  @DecimalNullableJsonConverter()
  final String? larguraCm;
  @JsonKey(name: 'altura_cm')
  @DecimalNullableJsonConverter()
  final String? alturaCm;
  @JsonKey(name: 'profundidade_cm')
  @DecimalNullableJsonConverter()
  final String? profundidadeCm;
  @JsonKey(name: 'area_m2')
  @DecimalNullableJsonConverter()
  final String? areaM2;
  @JsonKey(name: 'valor_declarado')
  @DecimalNullableJsonConverter()
  final String? valorDeclarado;
  @JsonKey(name: 'estado_atual')
  final String? estadoAtual;
  @JsonKey(name: 'cuidados_especiais')
  final String? cuidadosEspeciais;
  @JsonKey(name: 'valor_unitario_base')
  @DecimalJsonConverter()
  final String valorUnitarioBase;
  @JsonKey(name: 'valor_unitario_desconto')
  @DecimalJsonConverter()
  final String valorUnitarioDesconto;
  @JsonKey(name: 'valor_unitario_final')
  @DecimalJsonConverter()
  final String valorUnitarioFinal;
  @JsonKey(name: 'valor_total_bruto')
  @DecimalJsonConverter()
  final String valorTotalBruto;
  @JsonKey(name: 'valor_total_desconto')
  @DecimalJsonConverter()
  final String valorTotalDesconto;
  @JsonKey(name: 'valor_total_final')
  @DecimalJsonConverter()
  final String valorTotalFinal;
  @JsonKey(name: 'chave_foto_inicial')
  final String? chaveFotoInicial;
  @JsonKey(name: 'url_foto_inicial')
  final String? urlFotoInicial;
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
  @JsonKey(name: 'servicos_executados', includeToJson: false)
  final List<ServicoExecutadoItemModel>? servicosExecutados;
  @JsonKey(includeToJson: false)
  final List<ObservacaoModel>? observacoes;
  @JsonKey(name: 'intencoes_upload', includeToJson: false)
  final List<IntencaoUploadModel>? intencoesUpload;

  const ItemOrdemServicoModel({
    required this.id,
    required this.ordemServicoId,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.descricao,
    required this.categoria,
    this.material,
    required this.quantidade,
    this.larguraCm,
    this.alturaCm,
    this.profundidadeCm,
    this.areaM2,
    this.valorDeclarado,
    this.estadoAtual,
    this.cuidadosEspeciais,
    required this.valorUnitarioBase,
    required this.valorUnitarioDesconto,
    required this.valorUnitarioFinal,
    required this.valorTotalBruto,
    required this.valorTotalDesconto,
    required this.valorTotalFinal,
    this.chaveFotoInicial,
    this.urlFotoInicial,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.ordemServico,
    this.criadoPor,
    this.atualizadoPor,
    this.servicosExecutados,
    this.observacoes,
    this.intencoesUpload,
  });

  factory ItemOrdemServicoModel.fromJson(Map<String, dynamic> json) =>
      _$ItemOrdemServicoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemOrdemServicoModelToJson(this);

  ItemOrdemServicoModel copyWith({
    String? id,
    String? ordemServicoId,
    String? criadoPorId,
    String? atualizadoPorId,
    String? descricao,
    CategoriaItemModel? categoria,
    MaterialItemModel? material,
    int? quantidade,
    String? larguraCm,
    String? alturaCm,
    String? profundidadeCm,
    String? areaM2,
    String? valorDeclarado,
    String? estadoAtual,
    String? cuidadosEspeciais,
    String? valorUnitarioBase,
    String? valorUnitarioDesconto,
    String? valorUnitarioFinal,
    String? valorTotalBruto,
    String? valorTotalDesconto,
    String? valorTotalFinal,
    String? chaveFotoInicial,
    String? urlFotoInicial,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ServicoExecutadoItemModel>? servicosExecutados,
    List<ObservacaoModel>? observacoes,
    List<IntencaoUploadModel>? intencoesUpload,
  }) =>
      ItemOrdemServicoModel(
        id: id ?? this.id,
        ordemServicoId: ordemServicoId ?? this.ordemServicoId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        descricao: descricao ?? this.descricao,
        categoria: categoria ?? this.categoria,
        material: material ?? this.material,
        quantidade: quantidade ?? this.quantidade,
        larguraCm: larguraCm ?? this.larguraCm,
        alturaCm: alturaCm ?? this.alturaCm,
        profundidadeCm: profundidadeCm ?? this.profundidadeCm,
        areaM2: areaM2 ?? this.areaM2,
        valorDeclarado: valorDeclarado ?? this.valorDeclarado,
        estadoAtual: estadoAtual ?? this.estadoAtual,
        cuidadosEspeciais: cuidadosEspeciais ?? this.cuidadosEspeciais,
        valorUnitarioBase: valorUnitarioBase ?? this.valorUnitarioBase,
        valorUnitarioDesconto:
            valorUnitarioDesconto ?? this.valorUnitarioDesconto,
        valorUnitarioFinal: valorUnitarioFinal ?? this.valorUnitarioFinal,
        valorTotalBruto: valorTotalBruto ?? this.valorTotalBruto,
        valorTotalDesconto: valorTotalDesconto ?? this.valorTotalDesconto,
        valorTotalFinal: valorTotalFinal ?? this.valorTotalFinal,
        chaveFotoInicial: chaveFotoInicial ?? this.chaveFotoInicial,
        urlFotoInicial: urlFotoInicial ?? this.urlFotoInicial,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        ordemServico: ordemServico ?? this.ordemServico,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
        servicosExecutados: servicosExecutados ?? this.servicosExecutados,
        observacoes: observacoes ?? this.observacoes,
        intencoesUpload: intencoesUpload ?? this.intencoesUpload,
      );
}
