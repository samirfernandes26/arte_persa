import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:flutter/material.dart';

class AuthBrandHeader extends StatelessWidget {
  const AuthBrandHeader({
    super.key,
    required this.title,
    this.logoWidth = 250,
  });

  final String title;
  final double logoWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Image.asset(
          ImagesConstants.logo,
          width: logoWidth,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 18),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 42,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                letterSpacing: -0.8,
              ),
        ),
      ],
    );
  }
}
