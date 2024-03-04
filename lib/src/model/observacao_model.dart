import 'package:arte_persa/src/model/image_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'observacao_model.g.dart';

@JsonSerializable()
class ObservacaoModel {
  ObservacaoModel({
    this.id,
    this.observacao,
    this.image,
  });

  String? id;
  String? observacao;
  ImageModel? image;

  ObservacaoModel copyWith({
    String? id,
    String? observacao,
    ImageModel? image,
  }) {
    return ObservacaoModel(
      id: id ?? this.id,
      observacao: observacao ?? this.observacao,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() => _$ObservacaoModelToJson(this);
  factory ObservacaoModel.fromJson(Map<String, dynamic> json) =>
      _$ObservacaoModelFromJson(json);
}
