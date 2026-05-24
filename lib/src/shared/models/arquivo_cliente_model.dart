// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'cliente_model.dart';
import 'usuario_model.dart';

part 'arquivo_cliente_model.g.dart';

/// Arquivo anexado ao cadastro do cliente e armazenado no bucket.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ArquivoClienteModel {
  final String id;
  @JsonKey(name: 'cliente_id')
  final String clienteId;
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
  final String? rotulo;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(includeToJson: false)
  final ClienteModel? cliente;
  @JsonKey(name: 'criado_por', includeToJson: false)
  final UsuarioModel? criadoPor;

  const ArquivoClienteModel({
    required this.id,
    required this.clienteId,
    this.criadoPorId,
    required this.chaveS3,
    this.urlArquivo,
    required this.nomeArquivo,
    required this.tipoMime,
    required this.tamanhoBytes,
    this.rotulo,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.cliente,
    this.criadoPor,
  });

  factory ArquivoClienteModel.fromJson(Map<String, dynamic> json) =>
      _$ArquivoClienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArquivoClienteModelToJson(this);

  ArquivoClienteModel copyWith({
    String? id,
    String? clienteId,
    String? criadoPorId,
    String? chaveS3,
    String? urlArquivo,
    String? nomeArquivo,
    String? tipoMime,
    int? tamanhoBytes,
    String? rotulo,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ClienteModel? cliente,
    UsuarioModel? criadoPor,
  }) =>
      ArquivoClienteModel(
        id: id ?? this.id,
        clienteId: clienteId ?? this.clienteId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        chaveS3: chaveS3 ?? this.chaveS3,
        urlArquivo: urlArquivo ?? this.urlArquivo,
        nomeArquivo: nomeArquivo ?? this.nomeArquivo,
        tipoMime: tipoMime ?? this.tipoMime,
        tamanhoBytes: tamanhoBytes ?? this.tamanhoBytes,
        rotulo: rotulo ?? this.rotulo,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        cliente: cliente ?? this.cliente,
        criadoPor: criadoPor ?? this.criadoPor,
      );
}
