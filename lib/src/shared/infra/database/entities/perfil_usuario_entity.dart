import 'package:drift/drift.dart';

@DataClassName('PerfilUsuario')
class PerfilUsuarioEntity extends Table {
  @override
  String? get tableName => 'perfis_usuario';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get valor => text()();

  TextColumn get descricao => text()();
}
