sealed class CustomRegExp {
  static int somenteNumeros(
    String value, {
    bool isTelefone = false,
  }) {
    final regex = RegExp(r'(\d)');

    late String numeros;

    if (isTelefone) {
      numeros = value.startsWith('+55') ? value.substring(3) : value;
    } else {
      numeros = value;
    }

    return int.parse(
      regex.allMatches(numeros).map((digit) => digit.group(0)).join(),
    );
  }
}
