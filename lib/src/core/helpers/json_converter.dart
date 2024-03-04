import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

/// Conversor que converte um valor inteiro (1 ou 0) para um valor booleano.
class IntToBooleanConverter implements JsonConverter<bool, int> {
  const IntToBooleanConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object == true ? 1 : 0;
}

/// Conversor que converte uma string representando um número para um valor double.
class StringToDoubleConverter implements JsonConverter<double, String> {
  const StringToDoubleConverter();

  @override
  double fromJson(String json) => double.parse(json.replaceAll(',', '.'));

  @override
  String toJson(double object) => object.toString().replaceAll('.', ',');
}

class StringOrToDoubleConverter implements JsonConverter<double?, String?> {
  const StringOrToDoubleConverter();

  @override
  double? fromJson(String? json) =>
      json != null ? double.parse(json.replaceAll(',', '.')) : null;

  @override
  String? toJson(double? object) => object?.toString();
}

/// Conversor que converte uma string representando um número para um valor inteiro.
class StringToIntConverter implements JsonConverter<int, String> {
  const StringToIntConverter();

  @override
  int fromJson(String? json) =>
      json != null ? int.parse(json.replaceAll(',', '.')) : 0;

  @override
  String toJson(int object) => object.toString();
}

/// Conversor que converte um valor inteiro para uma string.
class IntToStringConverter implements JsonConverter<String?, int?> {
  const IntToStringConverter();

  @override
  String? fromJson(int? json) => json?.toString().replaceAll(',', '.');

  @override
  int? toJson(String? object) => object != null ? int.tryParse(object) : null;
}

/// Conversor que converte uma data e hora no formato brasileiro para um objeto DateTime.
class DateTimeBRToDateTime implements JsonConverter<DateTime, String> {
  const DateTimeBRToDateTime();

  static DateFormat dateTimeFormatoBrasileiro = DateFormat("dd/MM/yyyy HH:mm");

  @override
  DateTime fromJson(String json) {
    return dateTimeFormatoBrasileiro.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return dateTimeFormatoBrasileiro.format(object);
  }
}

/// Conversor que converte uma data no formato brasileiro para um objeto DateTime.
class DateBRToDateTime implements JsonConverter<DateTime, String> {
  const DateBRToDateTime();

  static DateFormat dateFormatoBrasileiro = DateFormat("dd/MM/yyyy");

  @override
  DateTime fromJson(String json) {
    return dateFormatoBrasileiro.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return dateFormatoBrasileiro.format(object);
  }
}

/// Conversor que converte uma data e hora representada como um inteiro para um objeto DateTime.
class DateTimeToInt implements JsonConverter<DateTime, int> {
  const DateTimeToInt();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json);
  }

  @override
  int toJson(DateTime object) {
    return object.millisecondsSinceEpoch;
  }
}
