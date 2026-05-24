import 'factory_helpers.dart';

sealed class CategoriaItemModelFactory {
  static CategoriaItemModel make({CategoriaItemModel? value}) {
    return value ?? makeFakeEnum(CategoriaItemModel.values);
  }
}
