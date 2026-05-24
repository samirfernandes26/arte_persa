export 'package:arte_persa/src/shared/models/models.dart';
export 'package:faker/faker.dart' show faker;

import 'package:faker/faker.dart';

DateTime makeFakeDateTime({int minYear = 2020, int? maxYear}) {
  return faker.date.dateTime(
    minYear: minYear,
    maxYear: maxYear ?? DateTime.now().year,
  );
}

DateTime makeFakeFutureDateTime() {
  return DateTime.now().add(
    Duration(days: faker.randomGenerator.integer(365, min: 1)),
  );
}

String makeFakeId() => faker.guid.guid();

String makeFakeMoney({double min = 10, double scale = 1000}) {
  return faker.randomGenerator
      .decimal(
        min: min,
        scale: scale,
      )
      .toStringAsFixed(2);
}

String makeFakePercentage() {
  return faker.randomGenerator
      .decimal(
        min: 0,
        scale: 100,
      )
      .toStringAsFixed(2);
}

String makeFakeDecimalString({double min = 1, double scale = 100}) {
  return faker.randomGenerator
      .decimal(
        min: min,
        scale: scale,
      )
      .toStringAsFixed(2);
}

String makeFakeLatitude() {
  return faker.randomGenerator
      .decimal(
        min: -90,
        scale: 180,
      )
      .toStringAsFixed(6);
}

String makeFakeLongitude() {
  return faker.randomGenerator
      .decimal(
        min: -180,
        scale: 360,
      )
      .toStringAsFixed(6);
}

String makeFakePhoneNumber() {
  return faker.randomGenerator.fromPattern(['(##) #####-####']);
}

String makeFakeCep() {
  return faker.randomGenerator.fromPattern(['#####-###']);
}

String makeFakeDocumento() {
  return faker.randomGenerator.fromPattern([
    '###.###.###-##',
    '##.###.###/####-##',
  ]);
}

String makeFakeCode({required String prefix}) {
  return '${prefix.toUpperCase()}-${faker.randomGenerator.fromPattern([
        '#####'
      ])}';
}

String makeFakeMimeType() {
  return faker.randomGenerator.element([
    'image/jpeg',
    'image/png',
    'application/pdf',
  ]);
}

String makeFakeFileName() {
  final extension = faker.randomGenerator.element(['jpg', 'png', 'pdf']);

  return 'arquivo_${makeFakeId()}.$extension';
}

String makeFakeStorageKey() {
  return 'uploads/${makeFakeId()}';
}

Map<String, dynamic> makeFakeMap({String? label}) {
  return {
    'id': makeFakeId(),
    'label': label ?? faker.lorem.word(),
    'descricao': faker.lorem.sentence(),
  };
}

T makeFakeEnum<T>(List<T> values) => faker.randomGenerator.element(values);
