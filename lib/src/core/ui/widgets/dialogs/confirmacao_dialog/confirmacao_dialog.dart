import 'package:flutter/material.dart';

class ConfirmacaoDialog extends StatelessWidget {
  const ConfirmacaoDialog({
    super.key,
    required this.onPressedConfirmation,
    required this.onPressedNegation,
    required this.title,
    required this.description,
  });
  final void Function() onPressedConfirmation;
  final void Function() onPressedNegation;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: context.brightness == Brightness.dark
          ? context.theme.colorScheme.onSurface
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(title, style: const TextStyle(fontSize: 20)),
      content: Text(description),
      actions: [
        TextButton(
          onPressed: () {
            onPressedNegation();
          },
          child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () {
            onPressedConfirmation();
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
