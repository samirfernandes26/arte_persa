import 'dart:developer';

import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutServiceImpl implements LogoutService {
  LogoutServiceImpl({
    required this.autenticacaoRepository,
    required this.database,
  });

  AutenticacaoRepository autenticacaoRepository;
  final Database database;

  @override
  Future<Either<ServiceException, Nil>> execute() async {
    try {
      final sp = await SharedPreferences.getInstance();

      autenticacaoRepository.logout();

      await database.transaction(() async {
        for (final statement in deletarProducao) {
          await database.customStatement(statement);
        }

        sp.remove(LocalStorageKeys.instanciaInfo);
        sp.remove(LocalStorageKeys.userInfo);
        sp.remove(LocalStorageKeys.accessToken);
        sp.remove(LocalStorageKeys.deviceUuid);
      });

      return Success(nil);
    } on Exception catch (e) {
      log('Erro ao realizar logout', error: e);

      return Failure(
        ServiceException(message: 'Não foi possível realizar o logout.'),
      );
    }
  }
}
