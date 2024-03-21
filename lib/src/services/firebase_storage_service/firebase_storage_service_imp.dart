import 'dart:io';

import 'package:arte_persa/src/core/exceptions/service_exception.dart';
import 'package:arte_persa/src/core/fp/either.dart';
import 'package:arte_persa/src/model/image_model.dart';
import 'package:arte_persa/src/services/firebase_storage_service/firebase_storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServiceImp extends FirebaseStorageService {
  @override
  Future<Either<ServiceException, ImageModel>> upload({
    required File file,
    required String fileName,
    required String pathService,
  }) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    final rest = await firebaseStorage
        .ref(
          "$pathService/$fileName.png",
        )
        .putFile(
          file,
        );

    final image = ImageModel(
      pathLocal: rest.ref.fullPath,
      pathService: rest.ref.parent!.fullPath,
      fileName: rest.metadata!.name,
    );

    String pathDownloadImage = await getDownLoadUrlByFileName(
      fileName: rest.metadata!.name,
      pathService: rest.ref.parent!.fullPath,
    );

    return Success(image);
  }

  @override
  Future<String> getDownLoadUrlByFileName({
    required String pathService,
    required String fileName,
  }) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    final rest =
        await firebaseStorage.ref("$pathService/$fileName").getDownloadURL();

    return rest;
  }
}
