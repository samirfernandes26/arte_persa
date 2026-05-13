import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/core/ui/widgets/headers/painel_brand_header/painel_brand_header.dart';
import 'package:flutter/material.dart';

class ClientesOverviewHeader extends StatelessWidget {
  const ClientesOverviewHeader({
    super.key,
    required this.username,
    required this.onCreateTap,
  });

  final String username;
  final VoidCallback onCreateTap;

  @override
  Widget build(BuildContext context) {
    return PainelBrandHeader(
      username: username,
      leading: _AddClientButton(onTap: onCreateTap),
    );
  }
}

class _AddClientButton extends StatelessWidget {
  const _AddClientButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            '+',
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
