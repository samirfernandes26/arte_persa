import 'package:drift/drift.dart';

@DataClassName('TipoPessoaCliente')
class TipoPessoaClienteEntity extends Table {
  @override
  String? get tableName => 'tipos_pessoa_cliente';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
