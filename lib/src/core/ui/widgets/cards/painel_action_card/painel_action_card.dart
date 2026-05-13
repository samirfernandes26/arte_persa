import 'package:arte_persa/src/screens/painel/painel_mock_data.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class PainelActionCard extends StatelessWidget {
  const PainelActionCard({
    super.key,
    required this.data,
    required this.onTap,
  });

  final PainelActionData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(PainelStyles.cardRadius),
        child: Container(
          decoration: BoxDecoration(
            color: data.backgroundColor,
            borderRadius: BorderRadius.circular(PainelStyles.cardRadius),
            boxShadow: [
              BoxShadow(
                color: PainelStyles.shadowColor.withValues(alpha: 0.20),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                data.icon,
                size: 38,
                color: PainelStyles.textPrimary,
              ),
              const SizedBox(height: 12),
              Text(
                data.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13.5,
                  color: PainelStyles.textPrimary,
                  fontWeight: FontWeight.w600,
                  height: 1.15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
