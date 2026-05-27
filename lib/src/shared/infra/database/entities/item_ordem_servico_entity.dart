import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/categoria_item_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/material_item_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('ItemOrdemServico')
class ItemOrdemServicoEntity extends Table {
  @override
  String? get tableName => 'itens_ordem_servico';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('ordem_servico_id')
  IntColumn get ordemServicoId =>
      integer().named('ordem_servico_id').references(
            OrdemServicoEntity,
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

  TextColumn get descricao => text()();

  IntColumn get categoria => integer().references(
        CategoriaItemEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  IntColumn get material => integer().nullable().references(
        MaterialItemEntity,
        #id,
        onDelete: KeyAction.setNull,
        onUpdate: KeyAction.cascade,
      )();

  IntColumn get quantidade => integer()();

  @JsonKey('largura_cm')
  TextColumn get larguraCm => text().nullable().named('largura_cm')();

  @JsonKey('altura_cm')
  TextColumn get alturaCm => text().nullable().named('altura_cm')();

  @JsonKey('profundidade_cm')
  TextColumn get profundidadeCm => text().nullable().named('profundidade_cm')();

  @JsonKey('area_m2')
  TextColumn get areaM2 => text().nullable().named('area_m2')();

  @JsonKey('valor_declarado')
  TextColumn get valorDeclarado => text().nullable().named('valor_declarado')();

  @JsonKey('estado_atual')
  TextColumn get estadoAtual => text().nullable().named('estado_atual')();

  @JsonKey('cuidados_especiais')
  TextColumn get cuidadosEspeciais =>
      text().nullable().named('cuidados_especiais')();

  @JsonKey('valor_unitario_base')
  TextColumn get valorUnitarioBase => text().named('valor_unitario_base')();

  @JsonKey('valor_unitario_desconto')
  TextColumn get valorUnitarioDesconto =>
      text().named('valor_unitario_desconto')();

  @JsonKey('valor_unitario_final')
  TextColumn get valorUnitarioFinal => text().named('valor_unitario_final')();

  @JsonKey('valor_total_bruto')
  TextColumn get valorTotalBruto => text().named('valor_total_bruto')();

  @JsonKey('valor_total_desconto')
  TextColumn get valorTotalDesconto => text().named('valor_total_desconto')();

  @JsonKey('valor_total_final')
  TextColumn get valorTotalFinal => text().named('valor_total_final')();

  @JsonKey('chave_foto_inicial')
  TextColumn get chaveFotoInicial =>
      text().nullable().named('chave_foto_inicial')();

  @JsonKey('url_foto_inicial')
  TextColumn get urlFotoInicial =>
      text().nullable().named('url_foto_inicial')();

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
