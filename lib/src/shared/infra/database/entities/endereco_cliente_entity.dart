import 'package:drift/drift.dart';

import 'package:arte_persa/src/shared/infra/database/entities/cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/tipo_endereco_cliente_entity.dart';
import 'package:arte_persa/src/shared/infra/database/entities/usuario_entity.dart';

@DataClassName('EnderecoCliente')
class EnderecoClienteEntity extends Table {
  @override
  String? get tableName => 'enderecos_cliente';

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

  @JsonKey('tipo_endereco')
  IntColumn get tipoEndereco => integer().named('tipo_endereco').references(
        TipoEnderecoClienteEntity,
        #id,
        onDelete: KeyAction.cascade,
        onUpdate: KeyAction.cascade,
      )();

  TextColumn get rotulo => text().nullable()();

  TextColumn get destinatario => text().nullable()();

  TextColumn get cep => text().nullable()();

  TextColumn get logradouro => text()();

  TextColumn get numero => text().nullable()();

  TextColumn get complemento => text().nullable()();

  TextColumn get bairro => text().nullable()();

  TextColumn get cidade => text()();

  TextColumn get estado => text()();

  TextColumn get pais => text()();

  TextColumn get referencia => text().nullable()();

  BoolColumn get principal => boolean()();

  TextColumn get latitude => text().nullable()();

  TextColumn get longitude => text().nullable()();

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
