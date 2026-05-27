import 'package:drift/drift.dart';

@DataClassName('StatusOrdemServico')
class StatusOrdemServicoEntity extends Table {
  @override
  String? get tableName => 'status_ordem_servico';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
