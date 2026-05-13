import 'dart:developer';
import 'dart:io';
import 'package:fp/fp.dart';
import 'package:path_provider/path_provider.dart';

class DirectoryRepositoryImpl implements DirectoryRepository {
  const DirectoryRepositoryImpl();

  @override
  Future<Either<RepositoryException, Nil>> create({
    String? directoryName,
  }) async {
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      Directory('${dbFolder.path}/$directoryName').create(recursive: true);

      return Success(nil);
    } on RepositoryException catch (e, s) {
      log('DirectoryRepositoryImpl: create', error: e, stackTrace: s);
      return Failure(RepositoryException(message: e.message));
    } on Exception catch (e, s) {
      log('Erro ao tentar criar diretório', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Não foi possível criar diretório'),
      );
    }
  }

  @override
  Future<bool> directoryExists({required String directoryName}) async {
    final dbFolder = await getApplicationDocumentsDirectory();
    await for (var dir in dbFolder.list(recursive: true, followLinks: true)) {
      if (dir.path.contains('/$directoryName')) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<Either<RepositoryException, Nil>> deleteFile({
    required String path,
    bool? recursive = false,
  }) async {
    try {
      await File(path).delete();
      return Success(nil);
    } on RepositoryException catch (e, s) {
      log('DirectoryRepositoryImpl, deleteFile', error: e, stackTrace: s);
      return Failure(RepositoryException(message: e.message));
    } on Exception catch (e, s) {
      log('Erro ao deletar arquivo', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Não foi possível deletar o arquivo'),
      );
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> deleteDirectory({
    required String path,
    bool? recursive,
  }) async {
    try {
      await Directory(path).delete(recursive: recursive ?? false);

      return Success(nil);
    } on RepositoryException catch (e, s) {
      log('DirectoryRepositoryImpl, deleteDirectory', error: e, stackTrace: s);
      return Failure(RepositoryException(message: e.message));
    } on Exception catch (e, s) {
      log('Erro ao deletar diretório', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Não foi possível deletar o diretório'),
      );
    }
  }
}
