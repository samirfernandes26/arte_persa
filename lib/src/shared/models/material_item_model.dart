import 'enum_model_base.dart';

class MaterialItemModel extends EnumModelBase {
  const MaterialItemModel._({
    required super.valor,
    required super.descricao,
  });

  static const la = MaterialItemModel._(valor: 'la', descricao: 'La');
  static const seda = MaterialItemModel._(valor: 'seda', descricao: 'Seda');
  static const algodao = MaterialItemModel._(
    valor: 'algodao',
    descricao: 'Algodao',
  );
  static const sintetico = MaterialItemModel._(
    valor: 'sintetico',
    descricao: 'Sintetico',
  );
  static const couro = MaterialItemModel._(valor: 'couro', descricao: 'Couro');
  static const linho = MaterialItemModel._(valor: 'linho', descricao: 'Linho');
  static const veludo = MaterialItemModel._(
    valor: 'veludo',
    descricao: 'Veludo',
  );
  static const misto = MaterialItemModel._(valor: 'misto', descricao: 'Misto');
  static const outro = MaterialItemModel._(valor: 'outro', descricao: 'Outro');

  static const values = [
    la,
    seda,
    algodao,
    sintetico,
    couro,
    linho,
    veludo,
    misto,
    outro,
  ];
  static const valuesByValor = {
    'la': la,
    'seda': seda,
    'algodao': algodao,
    'sintetico': sintetico,
    'couro': couro,
    'linho': linho,
    'veludo': veludo,
    'misto': misto,
    'outro': outro,
  };

  static MaterialItemModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('MaterialItemModel invalido: $valor.'));
}
