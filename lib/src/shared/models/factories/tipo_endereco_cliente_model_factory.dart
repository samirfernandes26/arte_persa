import 'factory_helpers.dart';

sealed class TipoEnderecoClienteModelFactory {
  static TipoEnderecoClienteModel make({TipoEnderecoClienteModel? value}) {
    return value ?? makeFakeEnum(TipoEnderecoClienteModel.values);
  }
}
