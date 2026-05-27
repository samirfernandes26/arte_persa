import 'package:drift/drift.dart';

@DataClassName('VisibilidadeObservacao')
class VisibilidadeObservacaoEntity extends Table {
  @override
  String? get tableName => 'visibilidades_observacao';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
