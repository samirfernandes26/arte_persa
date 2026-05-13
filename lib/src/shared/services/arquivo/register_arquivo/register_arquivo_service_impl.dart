import 'dart:developer';

class RegisterArquivoServiceImpl implements RegisterArquivoService {
  Database database;

  RegisterArquivoServiceImpl({required this.database});

  @override
  Future<Either<ServiceException, Arquivo>> execute({
    required ArquivoModel data,
  }) async {
    try {
      Arquivo arquivo;

      arquivo = await database.transaction(
        () async => await database.arquivoDao.createOrUpdate(data: data),
      );
      return Success(arquivo);
    } on Exception catch (e, s) {
      log('RegisterArquivoServiceImpl:execute', error: e, stackTrace: s);
      return Failure(ServiceException(message: 'Erro ao salvar Arquivo '));
    }
  }
}
