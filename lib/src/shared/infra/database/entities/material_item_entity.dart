import 'package:drift/drift.dart';

@DataClassName('MaterialItem')
class MaterialItemEntity extends Table {
  @override
  String? get tableName => 'materiais_item';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
