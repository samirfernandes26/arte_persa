import 'package:json_annotation/json_annotation.dart';

part 'endereco_model.g.dart';

@JsonSerializable()
class EnderecoModel {
  EnderecoModel({
    this.id,
    this.userId,
    required this.cep,
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.bairro,
    required this.estado,
    required this.referencia,
    this.latitude,
    this.longitude,
  });

  String? id;

  @JsonKey(name: 'user_id')
  String? userId;

  String cep;

  String logradouro;

  String numero;

  String complemento;

  String bairro;

  String estado;

  String referencia;

  double? latitude;

  double? longitude;

  Map<String, dynamic> toJson() => _$EnderecoModelToJson(this);
  factory EnderecoModel.fromJson(Map<String, dynamic> json) =>
      _$EnderecoModelFromJson(json);
}
