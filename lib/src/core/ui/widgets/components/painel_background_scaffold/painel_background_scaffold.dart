import 'dart:ui';

import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class PainelBackgroundScaffold extends StatelessWidget {
  const PainelBackgroundScaffold({
    super.key,
    required this.child,
    this.maxWidth = 520,
    this.padding = const EdgeInsets.fromLTRB(20, 20, 20, 28),
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: PainelStyles.backgroundColor),
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
                PainelStyles.backgroundColor.withValues(alpha: 0.20),
                PainelStyles.backgroundColor.withValues(alpha: 0.08),
                PainelStyles.backgroundColor.withValues(alpha: 0.16),
              ],
            ),
          ),
        ),
        const Positioned(
          top: -36,
          right: -56,
          child: _SoftShape(
            width: 200,
            height: 150,
            opacity: 0.24,
          ),
        ),
        const Positioned(
          top: 220,
          left: -65,
          child: _SoftShape(
            width: 160,
            height: 220,
            opacity: 0.16,
          ),
        ),
        const Positioned(
          bottom: -60,
          left: 10,
          child: _SoftShape(
            width: 300,
            height: 200,
            opacity: 0.16,
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
      imageFilter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: PainelStyles.overlayColor.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );
  }
}
