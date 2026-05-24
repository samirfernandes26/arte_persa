// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'arquivo_cliente_model.dart';
import 'contato_cliente_model.dart';
import 'endereco_cliente_model.dart';
import 'enum_json_converters.dart';
import 'intencao_upload_model.dart';
import 'observacao_model.dart';
import 'ordem_servico_model.dart';
import 'tipo_pessoa_cliente_model.dart';
import 'usuario_model.dart';

part 'cliente_model.g.dart';

/// Cliente pessoa fisica ou juridica consumido pelo app.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ClienteModel {
  final String id;
  @JsonKey(name: 'tipo_pessoa')
  @TipoPessoaClienteModelConverter()
  final TipoPessoaClienteModel tipoPessoa;
  @JsonKey(includeToJson: false)
  final String? documento;
  @JsonKey(name: 'nome_razao_social')
  final String nomeRazaoSocial;
  @JsonKey(name: 'nome_fantasia_apelido')
  final String? nomeFantasiaApelido;
  @JsonKey(name: 'email_principal', includeToJson: false)
  final String? emailPrincipal;
  @JsonKey(name: 'telefone_principal', includeToJson: false)
  final String? telefonePrincipal;
  @JsonKey(name: 'observacoes_internas', includeToJson: false)
  final String? observacoesInternas;
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
  @JsonKey(includeToJson: false)
  final List<ContatoClienteModel>? contatos;
  @JsonKey(includeToJson: false)
  final List<EnderecoClienteModel>? enderecos;
  @JsonKey(includeToJson: false)
  final List<ArquivoClienteModel>? arquivos;
  @JsonKey(name: 'ordens_servico', includeToJson: false)
  final List<OrdemServicoModel>? ordensServico;
  @JsonKey(includeToJson: false)
  final List<ObservacaoModel>? observacoes;
  @JsonKey(name: 'intencoes_upload', includeToJson: false)
  final List<IntencaoUploadModel>? intencoesUpload;

  const ClienteModel({
    required this.id,
    required this.tipoPessoa,
    this.documento,
    required this.nomeRazaoSocial,
    this.nomeFantasiaApelido,
    this.emailPrincipal,
    this.telefonePrincipal,
    this.observacoesInternas,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.criadoPor,
    this.atualizadoPor,
    this.contatos,
    this.enderecos,
    this.arquivos,
    this.ordensServico,
    this.observacoes,
    this.intencoesUpload,
  });

  factory ClienteModel.fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);

  ClienteModel copyWith({
    String? id,
    TipoPessoaClienteModel? tipoPessoa,
    String? documento,
    String? nomeRazaoSocial,
    String? nomeFantasiaApelido,
    String? emailPrincipal,
    String? telefonePrincipal,
    String? observacoesInternas,
    String? criadoPorId,
    String? atualizadoPorId,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
    List<ContatoClienteModel>? contatos,
    List<EnderecoClienteModel>? enderecos,
    List<ArquivoClienteModel>? arquivos,
    List<OrdemServicoModel>? ordensServico,
    List<ObservacaoModel>? observacoes,
    List<IntencaoUploadModel>? intencoesUpload,
  }) =>
      ClienteModel(
        id: id ?? this.id,
        tipoPessoa: tipoPessoa ?? this.tipoPessoa,
        documento: documento ?? this.documento,
        nomeRazaoSocial: nomeRazaoSocial ?? this.nomeRazaoSocial,
        nomeFantasiaApelido: nomeFantasiaApelido ?? this.nomeFantasiaApelido,
        emailPrincipal: emailPrincipal ?? this.emailPrincipal,
        telefonePrincipal: telefonePrincipal ?? this.telefonePrincipal,
        observacoesInternas: observacoesInternas ?? this.observacoesInternas,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
        contatos: contatos ?? this.contatos,
        enderecos: enderecos ?? this.enderecos,
        arquivos: arquivos ?? this.arquivos,
        ordensServico: ordensServico ?? this.ordensServico,
        observacoes: observacoes ?? this.observacoes,
        intencoesUpload: intencoesUpload ?? this.intencoesUpload,
      );
}
