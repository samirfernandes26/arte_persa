import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/item_ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/servico_catalogo_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/unidade_cobranca_servico_entity.dart';

@DataClassName('ServicoExecutadoItem')
class ServicoExecutadoItemEntity extends Table {
  @override
  String? get tableName => 'servicos_executados_item';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('item_ordem_servico_id')
  IntColumn get itemOrdemServicoId =>
      integer().named('item_ordem_servico_id').references(
            ItemOrdemServicoEntity,
            #id,
            onDelete: KeyAction.cascade,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('servico_catalogo_id')
  IntColumn get servicoCatalogoId =>
      integer().nullable().named('servico_catalogo_id').references(
            ServicoCatalogoEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('nome_servico_snapshot')
  TextColumn get nomeServicoSnapshot => text().named('nome_servico_snapshot')();

  @JsonKey('categoria_servico_snapshot')
  TextColumn get categoriaServicoSnapshot =>
      text().nullable().named('categoria_servico_snapshot')();

  @JsonKey('unidade_cobranca_snapshot')
  IntColumn get unidadeCobrancaSnapshot =>
      integer().named('unidade_cobranca_snapshot').references(
            UnidadeCobrancaServicoEntity,
            #id,
            onDelete: KeyAction.cascade,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('valor_unitario_snapshot')
  TextColumn get valorUnitarioSnapshot =>
      text().named('valor_unitario_snapshot')();

  TextColumn get quantidade => text()();

  @JsonKey('valor_desconto')
  TextColumn get valorDesconto => text().named('valor_desconto')();

  @JsonKey('valor_total')
  TextColumn get valorTotal => text().named('valor_total')();

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
