import 'factory_helpers.dart';

sealed class MaterialItemModelFactory {
  static MaterialItemModel make({MaterialItemModel? value}) {
    return value ?? makeFakeEnum(MaterialItemModel.values);
  }
}
