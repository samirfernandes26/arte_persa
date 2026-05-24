// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'cliente_model.dart';
import 'decimal_json_converter.dart';
import 'enum_json_converters.dart';
import 'tipo_endereco_cliente_model.dart';
import 'usuario_model.dart';

part 'endereco_cliente_model.g.dart';

/// Endereco do cliente usado em cobranca, coleta, entrega ou operacao.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class EnderecoClienteModel {
  final String id;
  @JsonKey(name: 'cliente_id')
  final String clienteId;
  @JsonKey(name: 'criado_por_id')
  final String? criadoPorId;
  @JsonKey(name: 'atualizado_por_id')
  final String? atualizadoPorId;
  @JsonKey(name: 'tipo_endereco')
  @TipoEnderecoClienteModelConverter()
  final TipoEnderecoClienteModel tipoEndereco;
  final String? rotulo;
  final String? destinatario;
  final String? cep;
  final String logradouro;
  final String? numero;
  final String? complemento;
  final String? bairro;
  final String cidade;
  final String estado;
  final String pais;
  final String? referencia;
  final bool principal;
  @DecimalNullableJsonConverter()
  final String? latitude;
  @DecimalNullableJsonConverter()
  final String? longitude;
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

  const EnderecoClienteModel({
    required this.id,
    required this.clienteId,
    this.criadoPorId,
    this.atualizadoPorId,
    required this.tipoEndereco,
    this.rotulo,
    this.destinatario,
    this.cep,
    required this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    required this.cidade,
    required this.estado,
    required this.pais,
    this.referencia,
    required this.principal,
    this.latitude,
    this.longitude,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.cliente,
    this.criadoPor,
    this.atualizadoPor,
  });

  factory EnderecoClienteModel.fromJson(Map<String, dynamic> json) =>
      _$EnderecoClienteModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnderecoClienteModelToJson(this);

  EnderecoClienteModel copyWith({
    String? id,
    String? clienteId,
    String? criadoPorId,
    String? atualizadoPorId,
    TipoEnderecoClienteModel? tipoEndereco,
    String? rotulo,
    String? destinatario,
    String? cep,
    String? logradouro,
    String? numero,
    String? complemento,
    String? bairro,
    String? cidade,
    String? estado,
    String? pais,
    String? referencia,
    bool? principal,
    String? latitude,
    String? longitude,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    ClienteModel? cliente,
    UsuarioModel? criadoPor,
    UsuarioModel? atualizadoPor,
  }) =>
      EnderecoClienteModel(
        id: id ?? this.id,
        clienteId: clienteId ?? this.clienteId,
        criadoPorId: criadoPorId ?? this.criadoPorId,
        atualizadoPorId: atualizadoPorId ?? this.atualizadoPorId,
        tipoEndereco: tipoEndereco ?? this.tipoEndereco,
        rotulo: rotulo ?? this.rotulo,
        destinatario: destinatario ?? this.destinatario,
        cep: cep ?? this.cep,
        logradouro: logradouro ?? this.logradouro,
        numero: numero ?? this.numero,
        complemento: complemento ?? this.complemento,
        bairro: bairro ?? this.bairro,
        cidade: cidade ?? this.cidade,
        estado: estado ?? this.estado,
        pais: pais ?? this.pais,
        referencia: referencia ?? this.referencia,
        principal: principal ?? this.principal,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        cliente: cliente ?? this.cliente,
        criadoPor: criadoPor ?? this.criadoPor,
        atualizadoPor: atualizadoPor ?? this.atualizadoPor,
      );
}
