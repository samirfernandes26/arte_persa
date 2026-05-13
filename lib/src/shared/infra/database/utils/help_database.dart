import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

class HelpDatabase {
  static HelpDatabase? _instance;

  static Database? _database;

  HelpDatabase.internal();

  static HelpDatabase get instance => _instance ??= HelpDatabase.internal();

  static final _databaseFile = File('tmp/backup.db');

  static Future<Database> createDatabaseTestInstance({
    bool? clear = false,
    bool? memory = true,
  }) async {
    if (clear == true) {
      await deleteDatabaseTestInstance();
    }

    final QueryExecutor nativeBase = memory == true
        ? NativeDatabase.memory()
        : NativeDatabase.createInBackground(_databaseFile);

    final database = Database.forTesting(nativeBase);

    await Future.delayed(
      const Duration(seconds: 2),
      () async => await SeedsHandlerImpl(database: database).execute(),
    );

    _database = database;

    return database;
  }

  static Future<void> deleteDatabaseTestInstance() async {
    if (_database is Database) {
      await _database?.close();
    }

    if (await _databaseFile.exists()) {
      await _databaseFile.delete();
    }
  }
}
