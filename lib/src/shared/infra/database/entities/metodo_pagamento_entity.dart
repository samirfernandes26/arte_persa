import 'package:drift/drift.dart';

@DataClassName('MetodoPagamento')
class MetodoPagamentoEntity extends Table {
  @override
  String? get tableName => 'metodos_pagamento';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
