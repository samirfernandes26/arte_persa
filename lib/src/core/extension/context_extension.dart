import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void unfocus() => FocusScope.of(this).unfocus();
}