import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Masks {
  static MaskTextInputFormatter cep() => MaskTextInputFormatter(
    mask: '#####-###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static const String mask10 = '(##) ####-####';
  static const String mask11 = '(##) #####-####';

  static TextInputFormatter phone() => DynamicPhoneFormatter();

  static String maskTextForPhone(String raw) {
    final digits = raw.replaceAll(RegExp(r'\D'), '');

    if (digits.isEmpty) return '';

    final formatter = DynamicPhoneFormatter();

    return formatter
        .formatEditUpdate(
          const TextEditingValue(text: ''),
          TextEditingValue(text: digits),
        )
        .text;
  }
}

class DynamicPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.length > 11) digits = digits.substring(0, 11);

    final is11 = digits.length > 10;

    String text;
    if (is11) {
      // (##) #####-####
      text = _format11(digits);
    } else {
      // (##) ####-####
      text = _format10(digits);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  String _format10(String digits) {
    if (digits.isEmpty) return '';
    if (digits.length <= 2) return '($digits';
    if (digits.length <= 6) {
      return '(${digits.substring(0, 2)}) ${digits.substring(2)}';
    }
    return '(${digits.substring(0, 2)}) ${digits.substring(2, 6)}-${digits.substring(6)}';
  }

  String _format11(String digits) {
    if (digits.isEmpty) return '';
    if (digits.length <= 2) return '($digits';
    if (digits.length <= 7) {
      return '(${digits.substring(0, 2)}) ${digits.substring(2)}';
    }
    return '(${digits.substring(0, 2)}) ${digits.substring(2, 7)}-${digits.substring(7)}';
  }
}

class LastSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 1. Se tentar colocar espaço no começo, impede (retorna vazio ou texto sem espaço)
    if (newValue.text.startsWith(' ')) {
      return oldValue.text.isEmpty ? newValue.copyWith(text: '') : oldValue;
    }

    // 2. Lógica principal: Substituir múltiplos espaços por um só
    // Se o texto contém dois espaços seguidos...
    if (newValue.text.contains('  ')) {
      // Cria o novo texto substituindo '  ' por ' '
      final String newText = newValue.text.replaceAll('  ', ' ');

      // Ajusta a posição do cursor para não pular para o final ou inicio
      return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    return newValue;
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) => TextEditingValue(
    text: newValue.text.toUpperCase(),
    selection: newValue.selection,
  );
}

class UpperCaseTextFormatterCidadao extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) => TextEditingValue(
    text: newValue.text.toUpperCase().replaceAll(RegExp(r'\s+'), ' '),
    selection: newValue.selection,
  );
}

class NormalizeNameTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) => TextEditingValue(
    text: NomeNormalizerFormatter.normalizeName(newValue.text),
    selection: newValue.selection,
  );
}

class OnlyNumberTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) => TextEditingValue(text: newValue.text.replaceAll(RegExp(r'(\D+)'), ''));
}

class IntTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) => TextEditingValue(
    text: int.tryParse(newValue.text == '' ? '0' : newValue.text).toString(),
  );
}

class NoZeroLeadingNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '0' && oldValue.text.isEmpty) {
      return oldValue;
    }
    if (newValue.text.startsWith('0') && newValue.text.length > 1) {
      return oldValue;
    }
    return newValue;
  }
}

class DateInputHelper {
  static final DateFormat _birthDateFormat = DateFormat('dd/MM/yyyy');

  static MaskTextInputFormatter birthDateMaskFormatter() =>
      MaskTextInputFormatter(
        mask: '##/##/####',
        filter: {'#': RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.eager,
      );

  static DateTime? parseBirthDate(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();
    if (trimmed.isEmpty || trimmed.length != 10) return null;
    try {
      return _birthDateFormat.parseStrict(trimmed);
    } catch (_) {
      return null;
    }
  }

  static String? formatBirthDate(DateTime? value) {
    if (value == null) return null;
    return _birthDateFormat.format(value);
  }

  static bool isFutureDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return date.isAfter(today);
  }
}
