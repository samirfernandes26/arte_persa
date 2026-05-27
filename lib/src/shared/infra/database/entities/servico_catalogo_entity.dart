import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/unidade_cobranca_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('ServicoCatalogo')
class ServicoCatalogoEntity extends Table {
  @override
  String? get tableName => 'servicos_catalogo';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get nome => text()();

  TextColumn get descricao => text().nullable()();

  TextColumn get categoria => text().nullable()();

  @JsonKey('preco_base')
  TextColumn get precoBase => text().named('preco_base')();

  @JsonKey('unidade_cobranca')
  IntColumn get unidadeCobranca =>
      integer().named('unidade_cobranca').references(
            UnidadeCobrancaServicoEntity,
            #id,
            onDelete: KeyAction.cascade,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('prazo_medio_dias')
  IntColumn get prazoMedioDias =>
      integer().nullable().named('prazo_medio_dias')();

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
