import 'factory_helpers.dart';

sealed class MetodoPagamentoModelFactory {
  static MetodoPagamentoModel make({MetodoPagamentoModel? value}) {
    return value ?? makeFakeEnum(MetodoPagamentoModel.values);
  }
}
