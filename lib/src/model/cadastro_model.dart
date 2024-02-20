import 'package:json_annotation/json_annotation.dart';

part 'cadastro_model.g.dart';

@JsonSerializable()
class CadastroModel {
  CadastroModel({
    this.id,
    required this.email,
    required this.senha,
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
  String senha;
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

  Map<String, dynamic> toJson() => _$CadastroModelToJson(this);

  factory CadastroModel.fromJson(Map<String, dynamic> json) =>
      _$CadastroModelFromJson(json);
}
