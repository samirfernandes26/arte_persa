import 'enum_model_base.dart';

class UnidadeCobrancaServicoModel extends EnumModelBase {
  const UnidadeCobrancaServicoModel._({
    required super.valor,
    required super.descricao,
  });

  static const unidade = UnidadeCobrancaServicoModel._(
    valor: 'unidade',
    descricao: 'Unidade',
  );
  static const metroQuadrado = UnidadeCobrancaServicoModel._(
    valor: 'metro_quadrado',
    descricao: 'Metro quadrado',
  );
  static const metroLinear = UnidadeCobrancaServicoModel._(
    valor: 'metro_linear',
    descricao: 'Metro linear',
  );

  static const values = [unidade, metroQuadrado, metroLinear];
  static const valuesByValor = {
    'unidade': unidade,
    'metro_quadrado': metroQuadrado,
    'metro_linear': metroLinear,
  };

  static UnidadeCobrancaServicoModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException(
        'UnidadeCobrancaServicoModel invalido: $valor.',
      ));
}
