import 'factory_helpers.dart';

sealed class VisibilidadeObservacaoModelFactory {
  static VisibilidadeObservacaoModel make(
      {VisibilidadeObservacaoModel? value}) {
    return value ?? makeFakeEnum(VisibilidadeObservacaoModel.values);
  }
}
