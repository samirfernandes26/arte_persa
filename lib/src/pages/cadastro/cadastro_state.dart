import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'cadastro_state.g.dart';

enum CadastroStatus {
  initial,
  loaded,
  success,
  error,
}

class CadastroState {
  CadastroState({
    required this.status,
    this.form,
    this.message,
  });

  CadastroState.initial()
      : this(
          status: CadastroStatus.initial,
        );

  CadastroStatus status;
  CadastroForm? form;
  String? message;
}

@JsonSerializable()
class CadastroForm {
  CadastroForm({
    this.id,
    this.email,
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

  int? id;
  String? email;
  String? token;
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
