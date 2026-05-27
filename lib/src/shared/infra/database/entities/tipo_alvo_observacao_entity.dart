import 'package:drift/drift.dart';

@DataClassName('TipoAlvoObservacao')
class TipoAlvoObservacaoEntity extends Table {
  @override
  String? get tableName => 'tipos_alvo_observacao';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
