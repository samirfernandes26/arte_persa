import 'factory_helpers.dart';

sealed class CanalEntradaOrdemServicoModelFactory {
  static CanalEntradaOrdemServicoModel make(
      {CanalEntradaOrdemServicoModel? value}) {
    return value ?? makeFakeEnum(CanalEntradaOrdemServicoModel.values);
  }
}
