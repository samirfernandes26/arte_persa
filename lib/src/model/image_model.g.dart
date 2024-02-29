// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      pathLocal: json['path_local'] as String?,
      pathService: json['path_service'] as String?,
      fileName: json['file_name'] as String?,
      pathDownloadImage: json['path_download_image'] as String?,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'path_local': instance.pathLocal,
      'path_download_image': instance.pathDownloadImage,
      'path_service': instance.pathService,
      'file_name': instance.fileName,
    };
