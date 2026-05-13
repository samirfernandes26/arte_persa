import 'package:flutter/material.dart';

part 'alerta_basico/alerta_basico.dart';

bool _debugIsActive(BuildContext context) {
  if (context is Element && !context.debugIsActive) {
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary('This BuildContext is no longer valid.'),
      ErrorDescription(
        'The showDialog function context parameter is a BuildContext that is no longer valid.',
      ),
      ErrorHint(
        'This can commonly occur when the showDialog function is called after awaiting a Future. '
        'In this situation the BuildContext might refer to a widget that has already been disposed during the await. '
        'Consider using a parent context instead.',
      ),
    ]);
  }
  return true;
}
