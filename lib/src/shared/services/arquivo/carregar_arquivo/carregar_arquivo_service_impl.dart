import 'dart:developer';

import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:image_picker/image_picker.dart';

class CarregarArquivoServiceImpl implements CarregarArquivoService {
  @override
  Future<Either<ServiceException, String?>> execute() async {
    try {
      final ImagePicker picker = ImagePicker();

      final XFile? arquivo = await picker.pickMedia();

      if (arquivo == null) return Success(null);

      final size = await arquivo.length();

      if (size > 10485760) {
        throw ServiceException(message: 'O arquivo excede o limite de 10 MB.');
      }

      return Success(arquivo.path);
    } on ServiceException catch (e, s) {
      log('Erro ao carregar arquivo', error: e, stackTrace: s);

      return Failure(e);
    } on Exception catch (e, s) {
      log('Erro ao carregar arquivo', error: e, stackTrace: s);

      return Failure(ServiceException(message: 'Erro ao carregar arquivo'));
    }
  }
}
