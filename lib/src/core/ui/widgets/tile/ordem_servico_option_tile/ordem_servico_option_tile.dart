import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class OrdemServicoOptionTile extends StatelessWidget {
  const OrdemServicoOptionTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onChanged,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.16),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFFFCB49) : Colors.transparent,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: const Color(0xFFD0B088),
                width: 1.4,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF2B241D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Switch(
            value: selected,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF9B5A1F),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFD7B690),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
