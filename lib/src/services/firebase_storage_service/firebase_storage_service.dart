import 'dart:io';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/image_model.dart';

abstract class FirebaseStorageService {
  Future<Either<ServiceException, ImageModel>> upload(
      {required File file,
      required String fileName,
      required String pathService});
  Future<String> getDownLoadUrlByFileName(
      {required String pathService, required String fileName});
}
