import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cliente_pj_model.g.dart';

@JsonSerializable()
class ClientePjModel {
  ClientePjModel({
    required this.retemIss,
    required this.razaoSocial,
    required this.cnpj,
    required this.porQuemProcurar,
    required this.telefoneContatoUm,
    required this.telefoneContatoUmWhatsapp,
    required this.telefoneContatoDoisWhatsapp,
    required this.email,
    this.endereco,
    this.userId,
    this.id,
    this.telefoneContatoDois,
    this.mediaDaAvaliacao,
  });

  String? id;

  @JsonKey(name: 'retem_iss')
  bool retemIss;

  @JsonKey(name: 'razao_social')
  String razaoSocial;

  String cnpj;

  @JsonKey(name: 'por_quem_procurar')
  String porQuemProcurar;

  @JsonKey(name: 'telefone_contato_um')
  String telefoneContatoUm;

  @JsonKey(name: 'telefone_contato_um_Whatsapp')
  bool telefoneContatoUmWhatsapp;

  @JsonKey(name: 'telefone_contato_dois')
  String? telefoneContatoDois;

  @JsonKey(name: 'telefone_contato_dois_Whatsapp')
  bool telefoneContatoDoisWhatsapp;

  String email;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'media_da_avaliacao')
  @StringToDoubleConverter()
  double? mediaDaAvaliacao;

  EnderecoModel? endereco;

  Map<String, dynamic> toJson() => _$ClientePjModelToJson(this);
  factory ClientePjModel.fromJson(Map<String, dynamic> json) =>
      _$ClientePjModelFromJson(json);
}
