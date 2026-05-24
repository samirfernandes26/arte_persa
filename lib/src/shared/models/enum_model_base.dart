abstract class EnumModelBase {
  final String valor;
  final String descricao;

  const EnumModelBase({
    required this.valor,
    required this.descricao,
  });

  String toJson() => valor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other.runtimeType == runtimeType &&
          other is EnumModelBase &&
          other.valor == valor;

  @override
  int get hashCode => Object.hash(runtimeType, valor);

  @override
  String toString() => valor;
}

String enumValorFromJson(Object? json, String nome) {
  if (json is String && json.trim().isNotEmpty) {
    return json.trim();
  }

  throw FormatException('Valor invalido para $nome: $json.');
}
