import 'package:arte_persa/src/core/extension/string_extention.dart';
import 'package:arte_persa/src/core/helpers/date_string_to_datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
@JsonSerializable(explicitToJson: true)
class UsuarioModel {
  UsuarioModel({
    this.id,
    required this.email,
    required this.senha,
    required this.nome,
    required this.sobrenome,
    required this.cpf,
    required this.telefoneContatoUm,
    required this.contatoUmWhatsapp,
    this.telefoneContatoDois,
    required this.contatoDoisWhatsapp,
    required this.dataNascimento,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String email;
  String senha;
  String nome;

  @JsonKey(name: 'sobre_nome')
  String sobrenome;

  String cpf;

  @JsonKey(name: 'telefone_contato_um')
  String telefoneContatoUm;

  @JsonKey(name: 'contato_um_whatsapp')
  bool contatoUmWhatsapp;

  @JsonKey(name: 'telefone_contato_dois')
  String? telefoneContatoDois;

  @JsonKey(name: 'contato_dois_whatsapp')
  bool contatoDoisWhatsapp;

  @JsonKey(name: 'data_nascimento')
  DateTime dataNascimento;

  @JsonKey(name: 'created_at')
  @DateStringToDateTimeConverter()
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  @DateStringToDateTimeConverter()
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

  factory UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);

  UsuarioModel copyWithFromJson(Map<String, dynamic> json) => this
    ..id = json['id'] ?? id
    ..email = json['email'] ?? email
    ..senha = json['senha'] ?? senha
    ..nome = json['nome'] ?? nome
    ..sobrenome = json['sobre_nome'] ?? sobrenome
    ..cpf = json['cpf'] ?? cpf
    ..telefoneContatoUm = json['telefone_contato_um'] ?? telefoneContatoUm
    ..contatoUmWhatsapp = json['contato_um_whatsapp'] ?? contatoUmWhatsapp
    ..telefoneContatoDois = json['telefone_contato_dois'] ?? telefoneContatoDois
    ..contatoDoisWhatsapp = json['contato_dois_whatsapp'] ?? contatoDoisWhatsapp
    ..dataNascimento =
        json['data_nascimento']?.toString().toDateTime ?? dataNascimento
    ..createdAt = json['created_at']?.toString().toDateTime ?? createdAt
    ..updatedAt = json['updated_at']?.toString().toDateTime ?? updatedAt;
}
