import 'enum_model_base.dart';

class StatusFaturaModel extends EnumModelBase {
  const StatusFaturaModel._({
    required super.valor,
    required super.descricao,
  });

  static const rascunho = StatusFaturaModel._(
    valor: 'rascunho',
    descricao: 'Rascunho',
  );
  static const emitida = StatusFaturaModel._(
    valor: 'emitida',
    descricao: 'Emitida',
  );
  static const paga = StatusFaturaModel._(valor: 'paga', descricao: 'Paga');
  static const vencida = StatusFaturaModel._(
    valor: 'vencida',
    descricao: 'Vencida',
  );
  static const cancelada = StatusFaturaModel._(
    valor: 'cancelada',
    descricao: 'Cancelada',
  );

  static const values = [rascunho, emitida, paga, vencida, cancelada];
  static const valuesByValor = {
    'rascunho': rascunho,
    'emitida': emitida,
    'paga': paga,
    'vencida': vencida,
    'cancelada': cancelada,
  };

  static StatusFaturaModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('StatusFaturaModel invalido: $valor.'));
}
