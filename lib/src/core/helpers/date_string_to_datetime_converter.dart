// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

class DateStringToDateTimeConverter
    implements JsonConverter<DateTime?, String?> {
  const DateStringToDateTimeConverter();

  static DateFormat dateFormat() => DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  DateTime? fromJson(String? json) =>
      json != null ? dateFormat().parse(json) : null;

  @override
  String? toJson(DateTime? object) =>
      object != null ? dateFormat().format(object) : null;
}
