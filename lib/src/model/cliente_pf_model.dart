import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:arte_persa/src/model/endereco_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cliente_pf_model.g.dart';

@JsonSerializable()
class ClientePfModel {
  ClientePfModel({
    required this.nome,
    required this.sobreNome,
    required this.cpf,
    required this.porQuemProcurar,
    required this.telefoneContatoUm,
    required this.telefoneContatoUmWhatsapp,
    required this.telefoneContatoDoisWhatsapp,
    required this.email,
    this.endereco,
    this.userId,
    this.id,
    this.dataNascimento,
    this.telefoneContatoDois,
    this.mediaDaAvaliacao,
  });

  String? id;

  String nome;

  @JsonKey(name: 'sobre_nome')
  String sobreNome;

  String cpf;

  @JsonKey(name: 'data_nascimento')
  String? dataNascimento;

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

  Map<String, dynamic> toJson() => _$ClientePfModelToJson(this);
  factory ClientePfModel.fromJson(Map<String, dynamic> json) =>
      _$ClientePfModelFromJson(json);
}
