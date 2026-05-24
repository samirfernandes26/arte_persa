import 'factory_helpers.dart';

sealed class UnidadeCobrancaServicoModelFactory {
  static UnidadeCobrancaServicoModel make(
      {UnidadeCobrancaServicoModel? value}) {
    return value ?? makeFakeEnum(UnidadeCobrancaServicoModel.values);
  }
}
