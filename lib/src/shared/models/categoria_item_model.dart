import 'enum_model_base.dart';

class CategoriaItemModel extends EnumModelBase {
  const CategoriaItemModel._({
    required super.valor,
    required super.descricao,
  });

  static const tapetePersa = CategoriaItemModel._(
    valor: 'tapete_persa',
    descricao: 'Tapete persa',
  );
  static const estofado = CategoriaItemModel._(
    valor: 'estofado',
    descricao: 'Estofado',
  );
  static const carpete = CategoriaItemModel._(
    valor: 'carpete',
    descricao: 'Carpete',
  );
  static const cortina = CategoriaItemModel._(
    valor: 'cortina',
    descricao: 'Cortina',
  );
  static const colchao = CategoriaItemModel._(
    valor: 'colchao',
    descricao: 'Colchao',
  );
  static const cadeira = CategoriaItemModel._(
    valor: 'cadeira',
    descricao: 'Cadeira',
  );
  static const sofa = CategoriaItemModel._(
    valor: 'sofa',
    descricao: 'Sofa',
  );
  static const poltrona = CategoriaItemModel._(
    valor: 'poltrona',
    descricao: 'Poltrona',
  );
  static const outro = CategoriaItemModel._(
    valor: 'outro',
    descricao: 'Outro',
  );

  static const values = [
    tapetePersa,
    estofado,
    carpete,
    cortina,
    colchao,
    cadeira,
    sofa,
    poltrona,
    outro,
  ];
  static const valuesByValor = {
    'tapete_persa': tapetePersa,
    'estofado': estofado,
    'carpete': carpete,
    'cortina': cortina,
    'colchao': colchao,
    'cadeira': cadeira,
    'sofa': sofa,
    'poltrona': poltrona,
    'outro': outro,
  };

  static CategoriaItemModel fromValor(String valor) =>
      valuesByValor[valor] ??
      (throw FormatException('CategoriaItemModel invalido: $valor.'));
}
