import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/fatura_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/item_ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/tipo_alvo_observacao_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/visibilidade_observacao_entity.dart';

@DataClassName('Observacao')
class ObservacaoEntity extends Table {
  @override
  String? get tableName => 'observacoes';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('tipo_alvo')
  IntColumn get tipoAlvo => integer().named('tipo_alvo').references(
        TipoAlvoObservacaoEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('ordem_servico_id')
  IntColumn get ordemServicoId =>
      integer().nullable().named('ordem_servico_id').references(
            OrdemServicoEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('item_ordem_servico_id')
  IntColumn get itemOrdemServicoId =>
      integer().nullable().named('item_ordem_servico_id').references(
            ItemOrdemServicoEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('cliente_id')
  IntColumn get clienteId =>
      integer().nullable().named('cliente_id').references(
            ClienteEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('fatura_id')
  IntColumn get faturaId => integer().nullable().named('fatura_id').references(
        FaturaEntity,
        #id,
        onDelete: KeyAction.setNull,
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

  IntColumn get visibilidade => integer().references(
        VisibilidadeObservacaoEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  TextColumn get titulo => text().nullable()();

  TextColumn get conteudo => text()();

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
