import 'factory_helpers.dart';

sealed class StatusOrdemServicoModelFactory {
  static StatusOrdemServicoModel make({StatusOrdemServicoModel? value}) {
    return value ?? makeFakeEnum(StatusOrdemServicoModel.values);
  }
}
