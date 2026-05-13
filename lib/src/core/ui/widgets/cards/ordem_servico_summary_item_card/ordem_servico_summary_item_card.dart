import 'package:arte_persa/src/screens/ordens_servico/ordem_servico_mock_data.dart';
import 'package:flutter/material.dart';

class OrdemServicoSummaryItemCard extends StatelessWidget {
  const OrdemServicoSummaryItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.quantityLabel,
    required this.imageData,
  });

  final String title;
  final String subtitle;
  final String quantityLabel;
  final OrdemServicoPreviewImageData imageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                imageData.backgroundColor.withValues(alpha: 0.94),
                imageData.backgroundColor.withValues(alpha: 0.72),
              ],
            ),
          ),
          child: Icon(
            imageData.icon,
            size: 34,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF332A24),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Quanti : 1',
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF332A24),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Text(
          quantityLabel,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF2E2218),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
