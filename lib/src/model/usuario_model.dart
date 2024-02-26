import 'package:json_annotation/json_annotation.dart';

part 'usuario_model.g.dart';

@JsonSerializable()
class UsuarioModel {
  UsuarioModel({
    this.id,
    required this.email,
    this.senha,
    this.token,
    this.nome,
    this.sobrenome,
    this.cpf,
    this.telefoneContatoUm,
    this.telefoneContatoDois,
    this.dataNascimento,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String email;
  String? token;
  String? senha;
  String? nome;
  String? sobrenome;
  String? cpf;

  @JsonKey(name: 'telefone_contato_um')
  String? telefoneContatoUm;

  @JsonKey(name: 'telefone_contato_dois')
  String? telefoneContatoDois;

  @JsonKey(name: 'data_nascimento')
  DateTime? dataNascimento;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

  factory UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);
}
