import 'package:flutter/material.dart';

class Validators {
  static Validators? _instance;
  // Avoid self instance
  Validators._();

  static Validators get instance =>
    _instance ??= Validators._();

  static FormFieldValidator<String> batata(String message, { int min = 10 }) => (String?  value) {
    if (value != null && value.length < min) {
      return message;
    } else {
      return null;
    }
  };
}