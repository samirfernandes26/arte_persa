import 'package:drift/drift.dart';

@DataClassName('StatusFatura')
class StatusFaturaEntity extends Table {
  @override
  String? get tableName => 'status_fatura';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
