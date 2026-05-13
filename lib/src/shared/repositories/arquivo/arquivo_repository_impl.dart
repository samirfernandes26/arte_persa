import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

class ArquivoRepositoryImpl implements ArquivoRepository {
  ArquivoRepositoryImpl({required this.restClient});

  final RestClient restClient;

  @override
  Future<Either<RepositoryException, ResponseArquivo>> setArquivo({
    required ArquivoModel arquivo,
    required int cdsWebId,
  }) async {
    try {
      FormData formData = await _buildFormData(
        arquivo: arquivo,
        cdsWebId: cdsWebId,
      );

      late ResponseArquivo responseArquivo;

      final Response(:data) = await restClient.auth.post(
        ApiKeys.setArquivo,
        data: formData,
      );

      if (data != null && data.isNotEmpty) {
        responseArquivo = ResponseArquivo.fromJson(data);
      }

      return Success(responseArquivo);
    } on Exception catch (e, s) {
      log('ArquivoRepositoryImpl:setArquivos', error: e, stackTrace: s);

      return Failure(
        RepositoryException(
          message: 'Erro ao tentar enviar o Arquivo para o servidor',
        ),
      );
    }
  }

  Future<FormData> _buildFormData({
    required ArquivoModel arquivo,
    required int cdsWebId,
  }) async {
    final Map<String, dynamic> formMap = {
      "web_id": cdsWebId,
      "app_arquivo_id": arquivo.appArquivoId,
      "tipo": arquivo.cdsTipo,
      "create_current_timestamp": arquivo.createCurrentTimestamp,
    };

    if (arquivo.path != null) {
      File file = File(arquivo.path!);
      String fileName = file.path.split(Platform.pathSeparator).last;
      String extension = path
          .extension(file.path)
          .replaceFirst('.', '')
          .toLowerCase();

      List<String> imagem = ['jpg', 'jpeg', 'png', 'gif'];
      List<String> video = ['mp4'];
      List<String> doc = ['pdf', 'docx', 'xlsx'];

      late String tipoArquivo;

      if (imagem.contains(extension)) {
        tipoArquivo = 'image';
      } else if (video.contains(extension)) {
        tipoArquivo = 'video';
      } else if (doc.contains(extension)) {
        tipoArquivo = 'doc';
      } else {
        tipoArquivo = 'application';
      }

      formMap["arquivo"] = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType(tipoArquivo, extension),
      );
    }

    return FormData.fromMap(formMap);
  }
}
