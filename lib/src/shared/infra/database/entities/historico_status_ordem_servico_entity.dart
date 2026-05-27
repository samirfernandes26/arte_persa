import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/status_ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('HistoricoStatusOrdemServico')
class HistoricoStatusOrdemServicoEntity extends Table {
  @override
  String? get tableName => 'historicos_status_ordem_servico';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('ordem_servico_id')
  IntColumn get ordemServicoId =>
      integer().named('ordem_servico_id').references(
            OrdemServicoEntity,
            #id,
            onDelete: KeyAction.cascade,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('usuario_id')
  IntColumn get usuarioId => integer().named('usuario_id').references(
        UsuarioEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('status_origem')
  IntColumn get statusOrigem =>
      integer().nullable().named('status_origem').references(
            StatusOrdemServicoEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('status_destino')
  IntColumn get statusDestino => integer().named('status_destino').references(
        StatusOrdemServicoEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  TextColumn get motivo => text().nullable()();

  TextColumn get metadados => text().nullable()();

  BoolColumn get ativo => boolean().withDefault(const Constant(true))();

  @JsonKey('data_criacao')
  DateTimeColumn get dataCriacao =>
      dateTime().named('data_criacao').withDefault(currentDateAndTime)();

  @JsonKey('data_atualizacao')
  DateTimeColumn get dataAtualizacao =>
      dateTime().named('data_atualizacao').withDefault(currentDateAndTime)();

  @JsonKey('data_exclusao')
  DateTimeColumn get dataExclusao =>
      dateTime().nullable().named('data_exclusao')();
}
