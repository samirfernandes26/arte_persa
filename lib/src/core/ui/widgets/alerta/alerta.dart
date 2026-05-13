import 'package:flutter/material.dart';

class Alerta extends StatelessWidget {
  final void Function() onConfirm;
  final void Function() onCancel;
  final String title;
  final String? content;
  final Color? surfaceTintColor;
  final Color? backgroundColor;

  const Alerta({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.title,
    this.content,
    this.surfaceTintColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: surfaceTintColor,
      backgroundColor: backgroundColor,
      icon: const Icon(Icons.warning_rounded, size: 64),
      title: Text(title, textAlign: TextAlign.center),
      titleTextStyle: context.theme.textTheme.titleLarge,
      content: content != null
          ? Text(
              content!,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyLarge,
            )
          : null,
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Row(
          children: [
            showButton(
              context,
              iconData: Icons.close,
              backgroundColor: Colors.red,
              label: 'Não',
              onPressed: onCancel,
            ),
            const SizedBox(width: 16),
            showButton(
              context,
              iconData: Icons.check,
              backgroundColor: Colors.green,
              label: 'Sim',
              onPressed: onConfirm,
            ),
          ],
        ),
      ],
    );
  }

  Flexible showButton(
    BuildContext context, {
    required IconData iconData,
    required void Function() onPressed,
    required String label,
    required Color backgroundColor,
  }) {
    return Flexible(
      flex: 1,
      child: ElevatedButton.icon(
        icon: Icon(iconData, color: Colors.white),
        onPressed: onPressed,
        label: Text(
          label,
          style: context.theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}
