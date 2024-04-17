import 'package:arte_persa/src/core/helpers/json_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'endereco_model.g.dart';

@JsonSerializable()
class EnderecoModel {
  EnderecoModel({
    this.id,
    this.userId,
    this.cep,
    this.logradouro,
    this.numero,
    this.complemento,
    this.bairro,
    this.estado,
    this.referencia,
    this.latitude,
    this.longitude,
  });

  String? id;

  @JsonKey(name: 'user_id')
  String? userId;

  String? cep;

  String? logradouro;

  String? numero;

  String? complemento;

  String? bairro;

  String? estado;

  String? referencia;

  double? latitude;

  double? longitude;

  Map<String, dynamic> toJson() => _$EnderecoModelToJson(this);
  factory EnderecoModel.fromJson(Map<String, dynamic> json) =>
      _$EnderecoModelFromJson(json);
}
