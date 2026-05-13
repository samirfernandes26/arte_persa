import 'package:arte_persa/src/screens/painel/painel_mock_data.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class PainelScheduleCard extends StatelessWidget {
  const PainelScheduleCard({
    super.key,
    required this.data,
  });

  final PainelAppointmentData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.92),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.18),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.clientName,
                  style: const TextStyle(
                    fontSize: 15.5,
                    color: PainelStyles.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.scheduleText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: PainelStyles.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data.serviceTitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: PainelStyles.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                data.serviceSubtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: PainelStyles.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
