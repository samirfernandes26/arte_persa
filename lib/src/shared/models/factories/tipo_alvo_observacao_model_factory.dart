import 'factory_helpers.dart';

sealed class TipoAlvoObservacaoModelFactory {
  static TipoAlvoObservacaoModel make({TipoAlvoObservacaoModel? value}) {
    return value ?? makeFakeEnum(TipoAlvoObservacaoModel.values);
  }
}
