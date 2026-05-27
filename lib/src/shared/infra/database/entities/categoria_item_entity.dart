import 'package:drift/drift.dart';

@DataClassName('CategoriaItem')
class CategoriaItemEntity extends Table {
  @override
  String? get tableName => 'categorias_item';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
