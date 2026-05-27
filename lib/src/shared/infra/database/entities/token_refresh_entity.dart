import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('TokenRefresh')
class TokenRefreshEntity extends Table {
  @override
  String? get tableName => 'tokens_refresh';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('usuario_id')
  IntColumn get usuarioId => integer().named('usuario_id').references(
        UsuarioEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('familia_token')
  TextColumn get familiaToken => text().nullable().named('familia_token')();

  @JsonKey('expira_em')
  DateTimeColumn get expiraEm => dateTime().named('expira_em')();

  @JsonKey('revogado_em')
  DateTimeColumn get revogadoEm => dateTime().nullable().named('revogado_em')();

  @JsonKey('ip_origem')
  TextColumn get ipOrigem => text().nullable().named('ip_origem')();

  @JsonKey('agente_usuario')
  TextColumn get agenteUsuario => text().nullable().named('agente_usuario')();

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
