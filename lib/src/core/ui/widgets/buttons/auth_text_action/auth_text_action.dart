import 'package:arte_persa/src/core/ui/widgets/components/auth_styles/auth_styles.dart';
import 'package:flutter/material.dart';

class AuthTextAction extends StatelessWidget {
  const AuthTextAction({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AuthStyles.actionTextColor,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
