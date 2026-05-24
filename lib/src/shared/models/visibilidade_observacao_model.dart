import 'enum_model_base.dart';

class VisibilidadeObservacaoModel extends EnumModelBase {
  const VisibilidadeObservacaoModel._({
    required super.valor,
    required super.descricao,
  });

  static const interna = VisibilidadeObservacaoModel._(
    valor: 'interna',
    descricao: 'Interna',
  );
  static const externa = VisibilidadeObservacaoModel._(
    valor: 'externa',
    descricao: 'Externa',
  );

  static const values = [interna, externa];
  static const valuesByValor = {
    'interna': interna,
    'externa': externa,
  };

  static VisibilidadeObservacaoModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('VisibilidadeObservacaoModel invalido: $valor.'));
}
