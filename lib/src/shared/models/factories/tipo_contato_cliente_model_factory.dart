import 'factory_helpers.dart';

sealed class TipoContatoClienteModelFactory {
  static TipoContatoClienteModel make({TipoContatoClienteModel? value}) {
    return value ?? makeFakeEnum(TipoContatoClienteModel.values);
  }
}
