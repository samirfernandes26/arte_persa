import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/observacao_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('ImagemObservacao')
class ImagemObservacaoEntity extends Table {
  @override
  String? get tableName => 'imagens_observacao';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('observacao_id')
  IntColumn get observacaoId => integer().named('observacao_id').references(
        ObservacaoEntity,
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

  @JsonKey('chave_s3')
  TextColumn get chaveS3 => text().named('chave_s3')();

  @JsonKey('url_arquivo')
  TextColumn get urlArquivo => text().nullable().named('url_arquivo')();

  @JsonKey('nome_arquivo')
  TextColumn get nomeArquivo => text().named('nome_arquivo')();

  @JsonKey('tipo_mime')
  TextColumn get tipoMime => text().named('tipo_mime')();

  @JsonKey('tamanho_bytes')
  IntColumn get tamanhoBytes => integer().named('tamanho_bytes')();

  IntColumn get posicao => integer()();

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
