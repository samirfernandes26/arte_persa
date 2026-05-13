import 'dart:developer';

import 'package:arte_persa/src/core/fp/fp.dart';

import 'v1/v1.dart';

class SeedsHandlerImpl implements SeedsHandler {
  SeedsHandlerImpl({required this.database});

  final Database database;

  @override
  Future<Either<SeedExcepection, Nil>> execute() async {
    try {
      final List<BaseSeeder> seeds = [];

      for (var seed in seeds) {
        await database.transaction(() async {
          final seedResult = await seed.handler();

          switch (seedResult) {
            case Failure(exception: SeedExcepection(:final message)):
              throw Exception(message);
            case Success():
              break;
          }
        });
      }

      return Success(nil);
    } on SeedExcepection catch (e, s) {
      log('Erro ao executar seed no banco de dados', error: e, stackTrace: s);

      return Failure(SeedExcepection(message: e.message));
    } on Exception catch (e, s) {
      log(
        'Erro ao executar semeadura no banco de dados',
        error: e,
        stackTrace: s,
      );

      return Failure(
        SeedExcepection(
          message: 'Erro ao executar semeadura no banco de dados',
        ),
      );
    }
  }
}
