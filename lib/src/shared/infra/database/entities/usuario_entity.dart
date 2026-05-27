import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/perfil_usuario_entity.dart';

@DataClassName('Usuario')
class UsuarioEntity extends Table {
  @override
  String? get tableName => 'usuarios';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text()();

  TextColumn get email => text()();

  IntColumn get perfil => integer().references(
        PerfilUsuarioEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  BoolColumn get ativo => boolean().withDefault(const Constant(true))();

  @JsonKey('ultimo_login_em')
  DateTimeColumn get ultimoLoginEm =>
      dateTime().nullable().named('ultimo_login_em')();

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
