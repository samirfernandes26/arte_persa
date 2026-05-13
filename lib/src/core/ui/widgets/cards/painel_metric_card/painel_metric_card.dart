import 'package:arte_persa/src/screens/painel/painel_mock_data.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class PainelMetricCard extends StatelessWidget {
  const PainelMetricCard({
    super.key,
    required this.data,
  });

  final PainelMetricData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: data.backgroundColor,
        borderRadius: BorderRadius.circular(PainelStyles.smallCardRadius),
        border: Border.all(
          color: PainelStyles.borderColor.withValues(alpha: 0.85),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: PainelStyles.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: PainelStyles.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
