import 'package:flutter/material.dart';

enum AlertType {
  error,
  success,
  info,
  warning;

  String get title => switch (this) {
        error => 'Ops! Algo deu errado.',
        success => 'Sucesso!',
        info => 'Informação importante.',
        warning => 'Cuidado!',
      };

  IconData get icon => switch (this) {
        error => Icons.error,
        success => Icons.check_circle,
        info => Icons.info,
        warning => Icons.warning,
      };

  Color get color => switch (this) {
        error => Colors.red.shade700,
        success => Colors.green.shade700,
        info => Colors.blue.shade700,
        warning => Colors.amber.shade700,
      };
}
