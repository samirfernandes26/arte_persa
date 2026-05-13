import 'package:json_annotation/json_annotation.dart';

part 'contato_model.g.dart';
part 'utils/contato_map.dart';

@JsonSerializable()
class ContatoModel {
  @JsonKey(name: 'telefone_residencia')
  String? telefoneResidencia;

  @JsonKey(name: 'telefone_contato')
  String? telefoneContato;

  @JsonKey(name: 'telefone_celular')
  String? telefoneCelular;

  String? email;

  ContatoModel({
    this.telefoneResidencia,
    this.telefoneContato,
    this.telefoneCelular,
    this.email,
  });

  Map<String, dynamic> toJson() => _$ContatoModelToJson(this);

  Map<int, dynamic> toMap() => _$ContatoModelToMap(this);

  factory ContatoModel.fromJson(Map<String, dynamic> json) =>
      _$ContatoModelFromJson(json);

  factory ContatoModel.fromMap(Map<int, dynamic> map) =>
      _$ContatoModelFromMap(map);
}
