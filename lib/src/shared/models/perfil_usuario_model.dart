import 'enum_model_base.dart';

class PerfilUsuarioModel extends EnumModelBase {
  const PerfilUsuarioModel._({
    required super.valor,
    required super.descricao,
  });

  static const funcionario = PerfilUsuarioModel._(
    valor: 'funcionario',
    descricao: 'Funcionario',
  );
  static const supervisor = PerfilUsuarioModel._(
    valor: 'supervisor',
    descricao: 'Supervisor',
  );
  static const master = PerfilUsuarioModel._(
    valor: 'master',
    descricao: 'Master',
  );

  static const values = [funcionario, supervisor, master];
  static const valuesByValor = {
    'funcionario': funcionario,
    'supervisor': supervisor,
    'master': master,
  };

  static PerfilUsuarioModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('PerfilUsuarioModel invalido: $valor.'));
}
