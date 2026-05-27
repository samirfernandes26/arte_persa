import 'package:drift/drift.dart';

@DataClassName('TipoContatoCliente')
class TipoContatoClienteEntity extends Table {
  @override
  String? get tableName => 'tipos_contato_cliente';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
