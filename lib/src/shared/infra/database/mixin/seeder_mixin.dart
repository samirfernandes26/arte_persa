import 'package:arte_persa/src/core/fp/fp.dart';
import 'package:drift/drift.dart';

mixin SeederMixin {
  Database? _database;

  void setDatabase(Database db) {
    _database = db;
  }

  Future<void> execute<T extends Table, D>(
    String seedName,
    TableInfo<T, D> table,
    Iterable<Insertable<D>> data,
  ) async {
    _checkDatabase();

    final hasSeeded = await _hasSeeded(seedName);

    if (!hasSeeded) {
      await _database!.transaction(() async {
        await _database!.batch(
          (batch) => batch.insertAllOnConflictUpdate(table, data),
        );

        await _recordMigrations(seedName);
      });
    }
  }

  Future<bool> _hasSeeded(String seedName) async {
    _checkDatabase();

    final query = _database!.select(_database!.migrationsEntity)
      ..where((tbl) => tbl.description.equals(seedName));

    final migration = await query.getSingleOrNull();

    return migration == null ? false : true;
  }

  Future<void> _recordMigrations(String description) async {
    _checkDatabase();

    await _database!
        .into(_database!.migrationsEntity)
        .insert(MigrationsEntityCompanion(description: Value(description)));
  }

  SeedExcepection? _checkDatabase() {
    if (_database == null) {
      throw SeedExcepection(message: 'Banco de dados não configurado');
    }

    return null;
  }
}
