import 'dart:ui';

import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:arte_persa/src/core/ui/widgets/components/auth_styles/auth_styles.dart';
import 'package:flutter/material.dart';

class AuthBackgroundScaffold extends StatelessWidget {
  const AuthBackgroundScaffold({
    super.key,
    required this.child,
    this.maxWidth = 520,
    this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: AuthStyles.backgroundColor),
        Image.asset(
          ImagesConstants.splashBackground,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AuthStyles.backgroundColor.withValues(alpha: 0.30),
                AuthStyles.backgroundColor.withValues(alpha: 0.12),
                AuthStyles.backgroundColor.withValues(alpha: 0.26),
              ],
            ),
          ),
        ),
        const Positioned(
          top: -48,
          right: -72,
          child: _SoftShape(
            width: 220,
            height: 160,
            opacity: 0.28,
          ),
        ),
        const Positioned(
          top: 280,
          left: -70,
          child: _SoftShape(
            width: 170,
            height: 230,
            opacity: 0.18,
          ),
        ),
        const Positioned(
          bottom: -70,
          left: 24,
          child: _SoftShape(
            width: 320,
            height: 220,
            opacity: 0.20,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: padding,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SoftShape extends StatelessWidget {
  const _SoftShape({
    required this.width,
    required this.height,
    required this.opacity,
  });

  final double width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AuthStyles.softShapeColor.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}
