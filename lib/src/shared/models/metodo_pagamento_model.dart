import 'enum_model_base.dart';

class MetodoPagamentoModel extends EnumModelBase {
  const MetodoPagamentoModel._({
    required super.valor,
    required super.descricao,
  });

  static const dinheiro = MetodoPagamentoModel._(
    valor: 'dinheiro',
    descricao: 'Dinheiro',
  );
  static const pix = MetodoPagamentoModel._(valor: 'pix', descricao: 'Pix');
  static const cartaoCredito = MetodoPagamentoModel._(
    valor: 'cartao_credito',
    descricao: 'Cartao de credito',
  );
  static const cartaoDebito = MetodoPagamentoModel._(
    valor: 'cartao_debito',
    descricao: 'Cartao de debito',
  );
  static const transferencia = MetodoPagamentoModel._(
    valor: 'transferencia',
    descricao: 'Transferencia',
  );
  static const boleto = MetodoPagamentoModel._(
    valor: 'boleto',
    descricao: 'Boleto',
  );
  static const outro = MetodoPagamentoModel._(
    valor: 'outro',
    descricao: 'Outro',
  );

  static const values = [
    dinheiro,
    pix,
    cartaoCredito,
    cartaoDebito,
    transferencia,
    boleto,
    outro,
  ];
  static const valuesByValor = {
    'dinheiro': dinheiro,
    'pix': pix,
    'cartao_credito': cartaoCredito,
    'cartao_debito': cartaoDebito,
    'transferencia': transferencia,
    'boleto': boleto,
    'outro': outro,
  };

  static MetodoPagamentoModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('MetodoPagamentoModel invalido: $valor.'));
}
