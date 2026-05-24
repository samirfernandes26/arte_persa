import 'factory_helpers.dart';

sealed class PerfilUsuarioModelFactory {
  static PerfilUsuarioModel make({PerfilUsuarioModel? value}) {
    return value ?? makeFakeEnum(PerfilUsuarioModel.values);
  }
}
