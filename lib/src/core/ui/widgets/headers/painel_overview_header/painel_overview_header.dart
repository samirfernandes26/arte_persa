import 'package:arte_persa/src/core/ui/constants/images_constants.dart';
import 'package:arte_persa/src/core/ui/widgets/cards/painel_metric_card/painel_metric_card.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/components/painel_user_avatar/painel_user_avatar.dart';
import 'package:arte_persa/src/screens/painel/painel_mock_data.dart';
import 'package:arte_persa/src/screens/painel/painel_session.dart';
import 'package:flutter/material.dart';

class PainelOverviewHeader extends StatelessWidget {
  const PainelOverviewHeader({
    super.key,
    required this.username,
    required this.metrics,
  });

  final String username;
  final List<PainelMetricData> metrics;

  @override
  Widget build(BuildContext context) {
    final displayName = PainelSession.formatDisplayName(username);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.86),
        borderRadius: BorderRadius.circular(PainelStyles.cardRadius),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.18),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  ImagesConstants.logo,
                  fit: BoxFit.contain,
                  height: 118,
                  alignment: Alignment.centerLeft,
                ),
              ),
              const SizedBox(width: 14),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 150),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PainelUserAvatar(username: username),
                    const SizedBox(height: 10),
                    Text(
                      displayName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 16,
                        color: PainelStyles.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Seja Bem vindo',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        color: PainelStyles.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              for (var i = 0; i < metrics.length; i++) ...[
                Expanded(child: PainelMetricCard(data: metrics[i])),
                if (i != metrics.length - 1) const SizedBox(width: 10),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
