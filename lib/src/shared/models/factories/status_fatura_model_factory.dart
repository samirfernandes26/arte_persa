import 'factory_helpers.dart';

sealed class StatusFaturaModelFactory {
  static StatusFaturaModel make({StatusFaturaModel? value}) {
    return value ?? makeFakeEnum(StatusFaturaModel.values);
  }
}
