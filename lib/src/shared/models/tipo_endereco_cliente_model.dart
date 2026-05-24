import 'enum_model_base.dart';

class TipoEnderecoClienteModel extends EnumModelBase {
  const TipoEnderecoClienteModel._({
    required super.valor,
    required super.descricao,
  });

  static const cobranca = TipoEnderecoClienteModel._(
    valor: 'cobranca',
    descricao: 'Cobranca',
  );
  static const coleta = TipoEnderecoClienteModel._(
    valor: 'coleta',
    descricao: 'Coleta',
  );
  static const entrega = TipoEnderecoClienteModel._(
    valor: 'entrega',
    descricao: 'Entrega',
  );
  static const outro = TipoEnderecoClienteModel._(
    valor: 'outro',
    descricao: 'Outro',
  );

  static const values = [cobranca, coleta, entrega, outro];
  static const valuesByValor = {
    'cobranca': cobranca,
    'coleta': coleta,
    'entrega': entrega,
    'outro': outro,
  };

  static TipoEnderecoClienteModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('TipoEnderecoClienteModel invalido: $valor.'));
}
