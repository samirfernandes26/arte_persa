// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

import 'usuario_model.dart';

part 'token_refresh_model.g.dart';

/// Sessao de refresh token. O hash do token nao deve trafegar para o app.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class TokenRefreshModel {
  final String id;
  @JsonKey(name: 'usuario_id')
  final String usuarioId;
  @JsonKey(name: 'familia_token')
  final String? familiaToken;
  @JsonKey(name: 'expira_em')
  final DateTime expiraEm;
  @JsonKey(name: 'revogado_em')
  final DateTime? revogadoEm;
  @JsonKey(name: 'ip_origem')
  final String? ipOrigem;
  @JsonKey(name: 'agente_usuario')
  final String? agenteUsuario;
  final bool ativo;
  @JsonKey(name: 'data_criacao')
  final DateTime dataCriacao;
  @JsonKey(name: 'data_atualizacao')
  final DateTime dataAtualizacao;
  @JsonKey(name: 'data_exclusao')
  final DateTime? dataExclusao;
  @JsonKey(includeToJson: false)
  final UsuarioModel? usuario;

  const TokenRefreshModel({
    required this.id,
    required this.usuarioId,
    this.familiaToken,
    required this.expiraEm,
    this.revogadoEm,
    this.ipOrigem,
    this.agenteUsuario,
    required this.ativo,
    required this.dataCriacao,
    required this.dataAtualizacao,
    this.dataExclusao,
    this.usuario,
  });

  factory TokenRefreshModel.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenRefreshModelToJson(this);

  TokenRefreshModel copyWith({
    String? id,
    String? usuarioId,
    String? familiaToken,
    DateTime? expiraEm,
    DateTime? revogadoEm,
    String? ipOrigem,
    String? agenteUsuario,
    bool? ativo,
    DateTime? dataCriacao,
    DateTime? dataAtualizacao,
    DateTime? dataExclusao,
    UsuarioModel? usuario,
  }) =>
      TokenRefreshModel(
        id: id ?? this.id,
        usuarioId: usuarioId ?? this.usuarioId,
        familiaToken: familiaToken ?? this.familiaToken,
        expiraEm: expiraEm ?? this.expiraEm,
        revogadoEm: revogadoEm ?? this.revogadoEm,
        ipOrigem: ipOrigem ?? this.ipOrigem,
        agenteUsuario: agenteUsuario ?? this.agenteUsuario,
        ativo: ativo ?? this.ativo,
        dataCriacao: dataCriacao ?? this.dataCriacao,
        dataAtualizacao: dataAtualizacao ?? this.dataAtualizacao,
        dataExclusao: dataExclusao ?? this.dataExclusao,
        usuario: usuario ?? this.usuario,
      );
}
