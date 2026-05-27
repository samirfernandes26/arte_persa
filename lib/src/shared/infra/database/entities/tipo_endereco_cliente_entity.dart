import 'package:drift/drift.dart';

@DataClassName('TipoEnderecoCliente')
class TipoEnderecoClienteEntity extends Table {
  @override
  String? get tableName => 'tipos_endereco_cliente';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
