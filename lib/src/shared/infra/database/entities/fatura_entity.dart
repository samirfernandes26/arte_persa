import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/metodo_pagamento_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/status_fatura_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('Fatura')
class FaturaEntity extends Table {
  @override
  String? get tableName => 'faturas';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('ordem_servico_id')
  IntColumn get ordemServicoId =>
      integer().named('ordem_servico_id').references(
            OrdemServicoEntity,
            #id,
            onDelete: KeyAction.cascade,
            onUpdate: KeyAction.cascade,
          )();

  TextColumn get numero => text()();

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

  IntColumn get status => integer().references(
        StatusFaturaEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('emitida_em')
  DateTimeColumn get emitidaEm => dateTime().nullable().named('emitida_em')();

  @JsonKey('vencimento_em')
  DateTimeColumn get vencimentoEm =>
      dateTime().nullable().named('vencimento_em')();

  @JsonKey('paga_em')
  DateTimeColumn get pagaEm => dateTime().nullable().named('paga_em')();

  @JsonKey('metodo_pagamento')
  IntColumn get metodoPagamento =>
      integer().nullable().named('metodo_pagamento').references(
            MetodoPagamentoEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('valor_subtotal')
  TextColumn get valorSubtotal => text().named('valor_subtotal')();

  @JsonKey('valor_desconto')
  TextColumn get valorDesconto => text().named('valor_desconto')();

  @JsonKey('valor_impostos')
  TextColumn get valorImpostos => text().named('valor_impostos')();

  @JsonKey('valor_total')
  TextColumn get valorTotal => text().named('valor_total')();

  TextColumn get observacoes => text().nullable()();

  @JsonKey('chave_pdf')
  TextColumn get chavePdf => text().nullable().named('chave_pdf')();

  @JsonKey('url_pdf')
  TextColumn get urlPdf => text().nullable().named('url_pdf')();

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
