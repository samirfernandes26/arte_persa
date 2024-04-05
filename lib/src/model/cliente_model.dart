import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cliente_model.g.dart';

@JsonSerializable()
class ClienteModel {
  ClienteModel({
    this.id,
    this.tipoCliente,
    this.retemIss,
    this.nome,
    this.sobreNome,
    this.razaoSocial,
    this.cpf,
    this.cnpj,
    this.dataNascimento,
    this.porQuemProcurar,
    this.telefoneContatoUm,
    this.telefoneContatoUmWhatsapp,
    this.telefoneContatoDois,
    this.telefoneContatoDoisWhatsapp,
    this.email,
    this.userId,
    this.mediaDaAvaliacao,
    this.latitude,
    this.longitude,
  });

  String? id;

  @JsonKey(name: 'tipo_cliente')
  int? tipoCliente;

  @JsonKey(name: 'retem_iss')
  bool? retemIss;

  String? nome;

  @JsonKey(name: 'sobre_nome')
  String? sobreNome;

  @JsonKey(name: 'razao_social')
  String? razaoSocial;

  String? cpf;

  String? cnpj;

  @JsonKey(name: 'data_nascimento')
  String? dataNascimento;

  @JsonKey(name: 'por_quem_procurar')
  String? porQuemProcurar;

  @JsonKey(name: 'telefone_contato_um')
  String? telefoneContatoUm;

  @JsonKey(name: 'telefone_contato_um_Whatsapp')
  bool? telefoneContatoUmWhatsapp;

  @JsonKey(name: 'telefone_contato_dois')
  String? telefoneContatoDois;

  @JsonKey(name: 'telefone_contato_dois_Whatsapp')
  bool? telefoneContatoDoisWhatsapp;

  String? email;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'media_da_avaliacao')
  @StringToDoubleConverter()
  double? mediaDaAvaliacao;

  @StringToDoubleConverter()
  double? latitude;

  @StringToDoubleConverter()
  double? longitude;

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);
  factory ClienteModel.fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);
}
