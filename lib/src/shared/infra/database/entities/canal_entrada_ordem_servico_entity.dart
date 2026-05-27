import 'package:drift/drift.dart';

@DataClassName('CanalEntradaOrdemServico')
class CanalEntradaOrdemServicoEntity extends Table {
  @override
  String? get tableName => 'canais_entrada_ordem_servico';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
