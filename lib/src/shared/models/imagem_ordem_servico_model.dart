// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'ordem_servico_model.dart';
import 'usuario_model.dart';

part 'imagem_ordem_servico_model.g.dart';

/// Imagem anexada diretamente a uma ordem de servico.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ImagemOrdemServicoModel {
  final String id;
  @JsonKey(name: 'ordem_servico_id')
  final String ordemServicoId;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
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
  @JsonKey(name: 'ordem_exibicao')
  final int ordemExibicao;
  final String? rotulo;
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

  const ImagemOrdemServicoModel({
    required this.id,
    required this.ordemServicoId,
    this.criadoPorId,
    required this.chaveS3,
    this.urlArquivo,
    required this.nomeArquivo,
    required this.tipoMime,
    required this.tamanhoBytes,
    required this.ordemExibicao,
    this.rotulo,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.ordemServico,
    this.criadoPor,
  });

  factory ImagemOrdemServicoModel.fromJson(Map<String, dynamic> json) =>
      _$ImagemOrdemServicoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagemOrdemServicoModelToJson(this);

  ImagemOrdemServicoModel copyWith({
    String? id,
    String? ordemServicoId,
    String? criadoPorId,
    String? chaveS3,
    String? urlArquivo,
    String? nomeArquivo,
    String? tipoMime,
    int? tamanhoBytes,
    int? ordemExibicao,
    String? rotulo,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    OrdemServicoModel? ordemServico,
    UsuarioModel? criadoPor,
  }) =>
      ImagemOrdemServicoModel(
        id: id ?? this.id,
        ordemServicoId: ordemServicoId ?? this.ordemServicoId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        chaveS3: chaveS3 ?? this.chaveS3,
        urlArquivo: urlArquivo ?? this.urlArquivo,
        nomeArquivo: nomeArquivo ?? this.nomeArquivo,
        tipoMime: tipoMime ?? this.tipoMime,
        tamanhoBytes: tamanhoBytes ?? this.tamanhoBytes,
        ordemExibicao: ordemExibicao ?? this.ordemExibicao,
        rotulo: rotulo ?? this.rotulo,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        ordemServico: ordemServico ?? this.ordemServico,
        criadoPor: criadoPor ?? this.criadoPor,
      );
}
