import 'package:json_annotation/json_annotation.dart';

part 'observacao_model.g.dart';

@JsonSerializable()
class ObservacaoModel {
  ObservacaoModel({
    this.id,
    this.observacao,
    this.pathFotoUm,
    this.pathFotoDois,
  });

  String? id;
  String? observacao;

  @JsonKey(name: 'path_foto_um')
  String? pathFotoUm;

  @JsonKey(name: 'path_foto_dois')
  String? pathFotoDois;

  Map<String, dynamic> toJson() => _$ObservacaoModelToJson(this);
  factory ObservacaoModel.fromJson(Map<String, dynamic> json) =>
      _$ObservacaoModelFromJson(json);
}
