import 'enum_model_base.dart';

class TipoAlvoObservacaoModel extends EnumModelBase {
  const TipoAlvoObservacaoModel._({
    required super.valor,
    required super.descricao,
  });

  static const ordemServico = TipoAlvoObservacaoModel._(
    valor: 'ordem_servico',
    descricao: 'Ordem de servico',
  );
  static const itemOrdemServico = TipoAlvoObservacaoModel._(
    valor: 'item_ordem_servico',
    descricao: 'Item da ordem de servico',
  );
  static const cliente = TipoAlvoObservacaoModel._(
    valor: 'cliente',
    descricao: 'Cliente',
  );
  static const fatura = TipoAlvoObservacaoModel._(
    valor: 'fatura',
    descricao: 'Fatura',
  );

  static const values = [ordemServico, itemOrdemServico, cliente, fatura];
  static const valuesByValor = {
    'ordem_servico': ordemServico,
    'item_ordem_servico': itemOrdemServico,
    'cliente': cliente,
    'fatura': fatura,
  };

  static TipoAlvoObservacaoModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('TipoAlvoObservacaoModel invalido: $valor.'));
}
