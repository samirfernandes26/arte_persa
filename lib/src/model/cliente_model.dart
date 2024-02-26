import 'package:json_annotation/json_annotation.dart';

part 'cliente_model.g.dart';

@JsonSerializable()
class ClienteModel {
  ClienteModel({
    this.id,
    required this.tipoCliente,
    required this.retemIss,
    required this.nomeCompleto,
    this.razaoSocial,
    this.cpf,
    this.cnpj,
    this.dataNascimento,
    this.porQuemProcurar,
    this.telefoneContatoUm,
    this.telefoneContatoDois,
    this.email,
    this.userId,
  });

  String? id;

  @JsonKey(name: 'tipo_cliente')
  String tipoCliente;

  @JsonKey(name: 'retem_iss')
  bool retemIss;

  @JsonKey(name: 'nome_completo')
  String nomeCompleto;

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

  @JsonKey(name: 'telefone_contato_dois')
  String? telefoneContatoDois;

  String? email;

  @JsonKey(name: 'user_id')
  String? userId;

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);
  factory ClienteModel.fromJson(Map<String, dynamic> json) => _$ClienteModelFromJson(json); 
}
