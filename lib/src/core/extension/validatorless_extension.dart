import 'package:arte_persa/src/core/validators/validators.dart';
import 'package:validatorless/validatorless.dart';

extension ValidatorsExtension on Validatorless {
  batata(String m, {int min = 10}) => Validators.batata(
        m,
        min: min,
      );
}
