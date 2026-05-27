import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/fatura_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/item_ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/ordem_servico_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('IntencaoUpload')
class IntencaoUploadEntity extends Table {
  @override
  String? get tableName => 'intencoes_upload';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('chave_s3')
  TextColumn get chaveS3 => text().named('chave_s3')();

  TextColumn get bucket => text()();

  @JsonKey('tipo_destino')
  TextColumn get tipoDestino => text().named('tipo_destino')();

  @JsonKey('nome_arquivo')
  TextColumn get nomeArquivo => text().named('nome_arquivo')();

  @JsonKey('tipo_mime')
  TextColumn get tipoMime => text().named('tipo_mime')();

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

  @JsonKey('usuario_solicitante_id')
  IntColumn get usuarioSolicitanteId =>
      integer().nullable().named('usuario_solicitante_id').references(
            UsuarioEntity,
            #id,
            onDelete: KeyAction.setNull,
            onUpdate: KeyAction.cascade,
          )();

  @JsonKey('confirmado_em')
  DateTimeColumn get confirmadoEm =>
      dateTime().nullable().named('confirmado_em')();

  @JsonKey('expira_em')
  DateTimeColumn get expiraEm => dateTime().named('expira_em')();

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
