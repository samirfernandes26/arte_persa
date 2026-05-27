import 'package:drift/drift.dart';

@DataClassName('UnidadeCobrancaServico')
class UnidadeCobrancaServicoEntity extends Table {
  @override
  String? get tableName => 'unidades_cobranca_servico';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
