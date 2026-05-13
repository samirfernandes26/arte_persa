import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class CadastroFormPanel extends StatelessWidget {
  const CadastroFormPanel({
    super.key,
    required this.title,
    required this.child,
    this.titleAlign = TextAlign.center,
  });

  final String title;
  final Widget child;
  final TextAlign titleAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 22),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.88),
        borderRadius: BorderRadius.circular(34),
        border: Border.all(
          color: PainelStyles.borderColor.withValues(alpha: 0.55),
        ),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.18),
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: titleAlign,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: PainelStyles.accentDark,
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  height: 1.06,
                ),
          ),
          const SizedBox(height: 22),
          child,
        ],
      ),
    );
  }
}
