import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final IconData? icon;
  final BuildContext context;
  final String label;
  final Color? color;

  const CustomChip({
    super.key,
    required this.context,
    required this.label,
    this.color = Colors.grey,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon != null ? Icon(icon, color: color) : null,
      backgroundColor: color?.withValues(alpha: 0.2),
      side: BorderSide.none,
      label: Text(label),
      labelStyle: context.theme.textTheme.titleMedium?.copyWith(color: color),
    );
  }
}
