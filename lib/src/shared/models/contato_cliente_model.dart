// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'cliente_model.dart';
import 'enum_json_converters.dart';
import 'tipo_contato_cliente_model.dart';
import 'usuario_model.dart';

part 'contato_cliente_model.g.dart';

/// Contato operacional ou comercial associado a um cliente.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ContatoClienteModel {
  final String id;
  @JsonKey(name: 'cliente_id')
  final String clienteId;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  final String nome;
  final String? setor;
  final String? cargo;
  @JsonKey(name: 'tipo_contato')
  @TipoContatoClienteModelConverter()
  final TipoContatoClienteModel tipoContato;
  final String valor;
  final bool principal;
  final String? observacoes;
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
  @JsonKey(name: 'atualizado_por', includeToJson: false)
  final UsuarioModel? atualizadoPor;

  const ContatoClienteModel({
    required this.id,
    required this.clienteId,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.nome,
    this.setor,
    this.cargo,
    required this.tipoContato,
    required this.valor,
    required this.principal,
    this.observacoes,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.cliente,
    this.criadoPor,
    this.atualizadoPor,
  });

  factory ContatoClienteModel.fromJson(Map<String, dynamic> json) =>
      _$ContatoClienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContatoClienteModelToJson(this);

  ContatoClienteModel copyWith({
    String? id,
    String? clienteId,
    String? criadoPorId,
    String? atualizadoPorId,
    String? nome,
    String? setor,
    String? cargo,
    TipoContatoClienteModel? tipoContato,
    String? valor,
    bool? principal,
    String? observacoes,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ClienteModel? cliente,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
  }) =>
      ContatoClienteModel(
        id: id ?? this.id,
        clienteId: clienteId ?? this.clienteId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        nome: nome ?? this.nome,
        setor: setor ?? this.setor,
        cargo: cargo ?? this.cargo,
        tipoContato: tipoContato ?? this.tipoContato,
        valor: valor ?? this.valor,
        principal: principal ?? this.principal,
        observacoes: observacoes ?? this.observacoes,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        cliente: cliente ?? this.cliente,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
      );
}
