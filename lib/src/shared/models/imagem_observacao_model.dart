// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'observacao_model.dart';
import 'usuario_model.dart';

part 'imagem_observacao_model.g.dart';

/// Imagem anexada a uma observacao.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ImagemObservacaoModel {
  final String id;
  @JsonKey(name: 'observacao_id')
  final String observacaoId;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  @JsonKey(name: 'chave_s3')
  final String chaveS3;
  @JsonKey(name: 'url_arquivo')
  final String? urlArquivo;
  @JsonKey(name: 'nome_arquivo')
  final String nomeArquivo;
  @JsonKey(name: 'tipo_mime')
  final String tipoMime;
  @JsonKey(name: 'tamanho_bytes')
  final int tamanhoBytes;
  final int posicao;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(includeToJson: false)
  final ObservacaoModel? observacao;
  @JsonKey(name: 'criado_por', includeToJson: false)
  final UsuarioModel? criadoPor;
  @JsonKey(name: 'atualizado_por', includeToJson: false)
  final UsuarioModel? atualizadoPor;

  const ImagemObservacaoModel({
    required this.id,
    required this.observacaoId,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.chaveS3,
    this.urlArquivo,
    required this.nomeArquivo,
    required this.tipoMime,
    required this.tamanhoBytes,
    required this.posicao,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.observacao,
    this.criadoPor,
    this.atualizadoPor,
  });

  factory ImagemObservacaoModel.fromJson(Map<String, dynamic> json) =>
      _$ImagemObservacaoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagemObservacaoModelToJson(this);

  ImagemObservacaoModel copyWith({
    String? id,
    String? observacaoId,
    String? criadoPorId,
    String? atualizadoPorId,
    String? chaveS3,
    String? urlArquivo,
    String? nomeArquivo,
    String? tipoMime,
    int? tamanhoBytes,
    int? posicao,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ObservacaoModel? observacao,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
  }) =>
      ImagemObservacaoModel(
        id: id ?? this.id,
        observacaoId: observacaoId ?? this.observacaoId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        chaveS3: chaveS3 ?? this.chaveS3,
        urlArquivo: urlArquivo ?? this.urlArquivo,
        nomeArquivo: nomeArquivo ?? this.nomeArquivo,
        tipoMime: tipoMime ?? this.tipoMime,
        tamanhoBytes: tamanhoBytes ?? this.tamanhoBytes,
        posicao: posicao ?? this.posicao,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        observacao: observacao ?? this.observacao,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
      );
}
