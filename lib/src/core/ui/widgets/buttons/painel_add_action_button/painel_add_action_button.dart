import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class PainelAddActionButton extends StatelessWidget {
  const PainelAddActionButton({
    super.key,
    required this.onTap,
    this.label = '+',
    this.child,
  });

  final VoidCallback onTap;
  final String label;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: child ??
              Text(
                label,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: PainelStyles.accentDark,
                      fontWeight: FontWeight.w300,
                      height: 0.8,
                    ),
              ),
        ),
      ),
    );
  }
}
