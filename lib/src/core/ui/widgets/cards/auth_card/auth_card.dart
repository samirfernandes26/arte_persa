import 'dart:ui';

import 'package:arte_persa/src/core/ui/widgets/components/auth_styles/auth_styles.dart';
import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {
  const AuthCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AuthStyles.cardRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AuthStyles.cardRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AuthStyles.cardStartColor.withValues(alpha: 0.92),
                AuthStyles.cardMidColor.withValues(alpha: 0.88),
                AuthStyles.cardStartColor.withValues(alpha: 0.82),
              ],
            ),
            border: Border.all(
              color: AuthStyles.cardBorderColor.withValues(alpha: 0.75),
            ),
            boxShadow: [
              BoxShadow(
                color: AuthStyles.cardShadowColor.withValues(alpha: 0.34),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
