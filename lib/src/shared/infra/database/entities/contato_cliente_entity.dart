import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/tipo_contato_cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('ContatoCliente')
class ContatoClienteEntity extends Table {
  @override
  String? get tableName => 'contatos_cliente';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('cliente_id')
  IntColumn get clienteId => integer().named('cliente_id').references(
        ClienteEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('criado_por_id')
  IntColumn get criadoPorId =>
      integer().nullable().named('criado_por_id').references(
            UsuarioEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('atualizado_por_id')
  IntColumn get atualizadoPorId =>
      integer().nullable().named('atualizado_por_id').references(
            UsuarioEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  TextColumn get nome => text()();

  TextColumn get setor => text().nullable()();

  TextColumn get cargo => text().nullable()();

  @JsonKey('tipo_contato')
  IntColumn get tipoContato => integer().named('tipo_contato').references(
        TipoContatoClienteEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  TextColumn get valor => text()();

  BoolColumn get principal => boolean()();

  TextColumn get observacoes => text().nullable()();

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
