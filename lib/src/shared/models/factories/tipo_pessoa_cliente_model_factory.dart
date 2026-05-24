import 'factory_helpers.dart';

sealed class TipoPessoaClienteModelFactory {
  static TipoPessoaClienteModel make({TipoPessoaClienteModel? value}) {
    return value ?? makeFakeEnum(TipoPessoaClienteModel.values);
  }
}
