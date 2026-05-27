import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/tipo_pessoa_cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('Cliente')
class ClienteEntity extends Table {
  @override
  String? get tableName => 'clientes';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('tipo_pessoa')
  IntColumn get tipoPessoa => integer().named('tipo_pessoa').references(
        TipoPessoaClienteEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  TextColumn get documento => text().nullable()();

  @JsonKey('nome_razao_social')
  TextColumn get nomeRazaoSocial => text().named('nome_razao_social')();

  @JsonKey('nome_fantasia_apelido')
  TextColumn get nomeFantasiaApelido =>
      text().nullable().named('nome_fantasia_apelido')();

  @JsonKey('email_principal')
  TextColumn get emailPrincipal => text().nullable().named('email_principal')();

  @JsonKey('telefone_principal')
  TextColumn get telefonePrincipal =>
      text().nullable().named('telefone_principal')();

  @JsonKey('observacoes_internas')
  TextColumn get observacoesInternas =>
      text().nullable().named('observacoes_internas')();

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
