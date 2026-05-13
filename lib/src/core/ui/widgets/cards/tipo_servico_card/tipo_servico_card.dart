import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/screens/servicos/tipos_servicos_mock_data.dart';
import 'package:flutter/material.dart';

class TipoServicoCard extends StatelessWidget {
  const TipoServicoCard({
    super.key,
    required this.data,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  final TipoServicoData data;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFFC9A976).withValues(alpha: 0.82),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.18),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 430;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: compact ? 74 : 84,
                    height: compact ? 74 : 84,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFF0E2CF),
                          Color(0xFFE8D3B5),
                        ],
                      ),
                    ),
                    child: Icon(
                      data.icon,
                      size: compact ? 38 : 42,
                      color: const Color(0xFF2D241E),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                            fontSize: compact ? 21 : 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            height: 1.12,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'Preço: ${data.displayPrice}',
                          style: TextStyle(
                            fontSize: compact ? 18 : 21,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            height: 1.15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _TipoServicoActionButton(
                    icon: Icons.edit_outlined,
                    onTap: onEditTap,
                  ),
                  const SizedBox(width: 10),
                  _TipoServicoActionButton(
                    icon: Icons.delete_outline_rounded,
                    onTap: onDeleteTap,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TipoServicoActionButton extends StatelessWidget {
  const _TipoServicoActionButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            size: 30,
            color: const Color(0xFF8F6235),
          ),
        ),
      ),
    );
  }
}
