import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

/// Função utilitária para remover o foco de todos os elementos de entrada de texto na tela.
void unfocus(BuildContext context) => FocusScope.of(context).unfocus();

/// Extensão para o contexto que adiciona uma função para remover o foco de todos os elementos de entrada de texto na tela.
extension UnFocusExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}

/// Classe contendo máscaras de entrada de texto.
class Masks {
  /// Retorna uma máscara para CEP.
  static cep() => MaskTextInputFormatter(
        mask: '#####-###',
        filter: {'#': RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy,
      );
}

/// Formatter para transformar texto em caixa alta (maiúsculas).
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) =>
      TextEditingValue(
        text: newValue.text.toUpperCase(),
        selection: newValue.selection,
      );
}

/// Formatter para permitir apenas números em um campo de entrada de texto.
class OnlyNumberTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    RegExp regex = RegExp(r'(\D+)');
    return TextEditingValue(
      text: newValue.text.replaceAll(regex, ''),
    );
  }
}

class IntTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: int.tryParse(newValue.text != "" ? newValue.text : '0').toString(),
    );
  }
}
