import 'package:flutter/material.dart';

class CadastroActionButtons extends StatelessWidget {
  const CadastroActionButtons({
    super.key,
    required this.secondaryLabel,
    required this.primaryLabel,
    required this.onSecondaryTap,
    required this.onPrimaryTap,
  });

  final String secondaryLabel;
  final String primaryLabel;
  final VoidCallback onSecondaryTap;
  final VoidCallback onPrimaryTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 380;

        if (compact) {
          return Column(
            children: [
              _CadastroButton(
                label: secondaryLabel,
                onTap: onSecondaryTap,
                secondary: true,
              ),
              const SizedBox(height: 12),
              _CadastroButton(
                label: primaryLabel,
                onTap: onPrimaryTap,
              ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(
              child: _CadastroButton(
                label: secondaryLabel,
                onTap: onSecondaryTap,
                secondary: true,
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: _CadastroButton(
                label: primaryLabel,
                onTap: onPrimaryTap,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CadastroButton extends StatelessWidget {
  const _CadastroButton({
    required this.label,
    required this.onTap,
    this.secondary = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: secondary
            ? const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFD1A97A),
                  Color(0xFFC89A68),
                ],
              )
            : const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF8A4814),
                  Color(0xFFA75D1C),
                ],
              ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB88D60).withValues(alpha: 0.20),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(26),
          child: SizedBox(
            height: 72,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
