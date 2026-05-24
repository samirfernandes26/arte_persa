import 'enum_model_base.dart';

class TipoPessoaClienteModel extends EnumModelBase {
  const TipoPessoaClienteModel._({
    required super.valor,
    required super.descricao,
  });

  static const pessoaFisica = TipoPessoaClienteModel._(
    valor: 'pessoa_fisica',
    descricao: 'Pessoa fisica',
  );
  static const pessoaJuridica = TipoPessoaClienteModel._(
    valor: 'pessoa_juridica',
    descricao: 'Pessoa juridica',
  );

  static const values = [pessoaFisica, pessoaJuridica];
  static const valuesByValor = {
    'pessoa_fisica': pessoaFisica,
    'pessoa_juridica': pessoaJuridica,
  };

  static TipoPessoaClienteModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('TipoPessoaClienteModel invalido: $valor.'));
}
