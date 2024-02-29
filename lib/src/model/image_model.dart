import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  ImageModel({
    this.pathLocal,
    this.pathService,
    this.fileName,
    this.pathDownloadImage,
  });

  @JsonKey(name: 'path_local')
  String? pathLocal;

  @JsonKey(name: 'path_download_image')
  String? pathDownloadImage;

  @JsonKey(name: 'path_service')
  String? pathService;

  @JsonKey(name: 'file_name')
  String? fileName;

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  ImageModel copyWith({
    String? pathLocal,
    String? pathDownloadImage,
    String? pathService,
    String? fileName,
  }) =>
      ImageModel(
        pathLocal: pathLocal ?? this.pathLocal,
        pathService: this.pathService,
        fileName: this.fileName,
        pathDownloadImage: pathDownloadImage ?? this.pathDownloadImage,
      );
}
