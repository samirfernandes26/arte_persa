import 'package:arte_persa/src/model/usuario_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'cadastro_co_state.g.dart';

enum CadastroCoStatus {
  initial,
  loaded,
  success,
  error,
}

class CadastroCoState {
  CadastroCoState({
    required this.status,
    required this.telefoneContatoUmWhatsapp,
    required this.telefoneContatoDoisWhatsapp,
    this.form,
    this.message,
    this.usuario,
  });

  CadastroCoState.initial()
      : this(
          status: CadastroCoStatus.initial,
          telefoneContatoUmWhatsapp: false,
          telefoneContatoDoisWhatsapp: false,
        );

  CadastroCoStatus status;
  CadastroForm? form;
  String? message;
  UsuarioModel? usuario;
  bool telefoneContatoUmWhatsapp;
  bool telefoneContatoDoisWhatsapp;

  CadastroCoState copyWith({
    CadastroCoStatus? status,
    CadastroForm? form,
    String? message,
    UsuarioModel? usuario,
    bool? telefoneContatoUmWhatsapp,
    bool? telefoneContatoDoisWhatsapp,
  }) =>
      CadastroCoState(
        status: status ?? this.status,
        form: form ?? this.form,
        message: message ?? this.message,
        usuario: usuario ?? this.usuario,
        telefoneContatoUmWhatsapp:
            telefoneContatoUmWhatsapp ?? this.telefoneContatoUmWhatsapp,
        telefoneContatoDoisWhatsapp:
            telefoneContatoDoisWhatsapp ?? this.telefoneContatoDoisWhatsapp,
      );
}

@JsonSerializable()
class CadastroForm {
  CadastroForm({
    this.id,
    this.email,
    this.token,
    this.senha,
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
  String? email;
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

  Map<String, dynamic> toJson() => _$CadastroFormToJson(this);

  factory CadastroForm.fromJson(Map<String, dynamic> json) =>
      _$CadastroFormFromJson(json);
}
