// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'enum_json_converters.dart';
import 'perfil_usuario_model.dart';

part 'usuario_model.g.dart';

/// Usuario autenticado da plataforma. Senha e hashes nunca pertencem ao app.
@JsonSerializable(includeIfNull: false)
class UsuarioModel {
  final String id;
  final String nome;
  final String email;
  @PerfilUsuarioModelConverter()
  final PerfilUsuarioModel perfil;
  final bool ativo;
  @JsonKey(name: 'ultimo_login_em')
  final DateTime? ultimoLoginEm;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;

  const UsuarioModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.perfil,
    required this.ativo,
    this.ultimoLoginEm,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

  UsuarioModel copyWith({
    String? id,
    String? nome,
    String? email,
    PerfilUsuarioModel? perfil,
    bool? ativo,
    DateTime? ultimoLoginEm,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
  }) =>
      UsuarioModel(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        email: email ?? this.email,
        perfil: perfil ?? this.perfil,
        ativo: ativo ?? this.ativo,
        ultimoLoginEm: ultimoLoginEm ?? this.ultimoLoginEm,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
      );
}
