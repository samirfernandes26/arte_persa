import 'dart:io';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'entities/entities.dart';
import 'daos/daos.dart';
import 'queries/queries.dart';

part 'database.g.dart';

@DriftDatabase(tables: [], daos: [], queries: {})
class Database extends _$Database {
  Database() : super(_openConnection());

  Database.forTesting(super.e);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (OpeningDetails detail) async {
      await customStatement('PRAGMA foreign_keys = ON');

      if (kDebugMode) {
        await connector.validateDatabaseSchema(this);
      }
    },
    onUpgrade: stepByStep(
      from1To2: (Migrator m, Schema2 schema) async {
        await m.deleteTable('error_recebimento_sincronizacao');
        await m.createTable(schema.getSyncronizacaoIncosistenciasEntity);
      },
    ),
  );

  Future<void> importInto(File file) async {
    await file.parent.create(recursive: true);

    if (file.existsSync()) {
      file.deleteSync();
    }

    await customStatement('VACUUM INTO ?', [file.path]);
  }
}

LazyDatabase _openConnection() => LazyDatabase(() async {
  final dbFolder = await getApplicationDocumentsDirectory();

  final file = File(path.join(dbFolder.path, 'arte-persa.sqlite'));

  return NativeDatabase.createInBackground(file);
});
