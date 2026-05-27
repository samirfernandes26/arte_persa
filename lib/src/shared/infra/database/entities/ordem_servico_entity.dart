import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/canal_entrada_ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/status_ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('OrdemServico')
class OrdemServicoEntity extends Table {
  @override
  String? get tableName => 'ordens_servico';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get codigo => text()();

  @JsonKey('cliente_id')
  IntColumn get clienteId => integer().named('cliente_id').references(
        ClienteEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('criado_por_id')
  IntColumn get criadoPorId => integer().named('criado_por_id').references(
        UsuarioEntity,
        #id,
        onDelete: KeyAction.cascade,
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

  @JsonKey('responsavel_id')
  IntColumn get responsavelId =>
      integer().nullable().named('responsavel_id').references(
            UsuarioEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('aprovado_por_desconto_id')
  IntColumn get aprovadoPorDescontoId =>
      integer().nullable().named('aprovado_por_desconto_id').references(
            UsuarioEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  IntColumn get status => integer().references(
        StatusOrdemServicoEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('canal_entrada')
  IntColumn get canalEntrada => integer().named('canal_entrada').references(
        CanalEntradaOrdemServicoEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  @JsonKey('agendada_coleta_em')
  DateTimeColumn get agendadaColetaEm =>
      dateTime().nullable().named('agendada_coleta_em')();

  @JsonKey('agendada_entrega_em')
  DateTimeColumn get agendadaEntregaEm =>
      dateTime().nullable().named('agendada_entrega_em')();

  @JsonKey('iniciada_em')
  DateTimeColumn get iniciadaEm => dateTime().nullable().named('iniciada_em')();

  @JsonKey('finalizada_em')
  DateTimeColumn get finalizadaEm =>
      dateTime().nullable().named('finalizada_em')();

  @JsonKey('cancelada_em')
  DateTimeColumn get canceladaEm =>
      dateTime().nullable().named('cancelada_em')();

  @JsonKey('snapshot_endereco_coleta')
  TextColumn get snapshotEnderecoColeta =>
      text().nullable().named('snapshot_endereco_coleta')();

  @JsonKey('snapshot_endereco_entrega')
  TextColumn get snapshotEnderecoEntrega =>
      text().nullable().named('snapshot_endereco_entrega')();

  @JsonKey('snapshot_cliente')
  TextColumn get snapshotCliente =>
      text().nullable().named('snapshot_cliente')();

  @JsonKey('snapshot_politica_desconto')
  TextColumn get snapshotPoliticaDesconto =>
      text().nullable().named('snapshot_politica_desconto')();

  @JsonKey('percentual_desconto')
  TextColumn get percentualDesconto => text().named('percentual_desconto')();

  @JsonKey('valor_desconto')
  TextColumn get valorDesconto => text().named('valor_desconto')();

  @JsonKey('valor_frete')
  TextColumn get valorFrete => text().named('valor_frete')();

  @JsonKey('valor_subtotal')
  TextColumn get valorSubtotal => text().named('valor_subtotal')();

  @JsonKey('valor_total')
  TextColumn get valorTotal => text().named('valor_total')();

  @JsonKey('motivo_desconto')
  TextColumn get motivoDesconto => text().nullable().named('motivo_desconto')();

  @JsonKey('observacoes_internas')
  TextColumn get observacoesInternas =>
      text().nullable().named('observacoes_internas')();

  @JsonKey('observacoes_cliente')
  TextColumn get observacoesCliente =>
      text().nullable().named('observacoes_cliente')();

  @JsonKey('chave_assinatura_cliente')
  TextColumn get chaveAssinaturaCliente =>
      text().nullable().named('chave_assinatura_cliente')();

  @JsonKey('url_assinatura_cliente')
  TextColumn get urlAssinaturaCliente =>
      text().nullable().named('url_assinatura_cliente')();

  @JsonKey('assinada_em')
  DateTimeColumn get assinadaEm => dateTime().nullable().named('assinada_em')();

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
