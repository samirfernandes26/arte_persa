import 'package:flutter/material.dart';

class FlexibleButton extends StatelessWidget {
  const FlexibleButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final IconData icon;
  final String label;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blueAccent,
        ),
        label: Text(
          label,
          style: context.theme.textTheme.titleSmall?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
