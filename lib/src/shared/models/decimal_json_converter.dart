// ignore_for_file: invalid_annotation_target

import 'package:json_annotation/json_annotation.dart';

class DecimalJsonConverter implements JsonConverter<String, Object?> {
  const DecimalJsonConverter();

  @override
  String fromJson(Object? json) => _parseDecimal(json, nullable: false)!;

  @override
  Object toJson(String object) => _parseDecimal(object, nullable: false)!;
}

class DecimalNullableJsonConverter implements JsonConverter<String?, Object?> {
  const DecimalNullableJsonConverter();

  @override
  String? fromJson(Object? json) => _parseDecimal(json, nullable: true);

  @override
  Object? toJson(String? object) => _parseDecimal(object, nullable: true);
}

String? _parseDecimal(Object? value, {required bool nullable}) {
  if (value == null) {
    if (nullable) {
      return null;
    }
    throw const FormatException('Valor decimal obrigatorio ausente.');
  }

  if (value is! String) {
    throw FormatException('Valor decimal deve chegar como String: $value.');
  }

  final text = value.trim().replaceAll(',', '.');
  if (text.isEmpty || !_decimalRegExp.hasMatch(text)) {
    throw FormatException('Valor decimal invalido: $value.');
  }

  return text;
}

final _decimalRegExp = RegExp(r'^-?\d+(\.\d+)?$');
