import 'package:arte_persa/src/core/ui/widgets/buttons/painel_add_action_button/painel_add_action_button.dart';
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
      leading: PainelAddActionButton(onTap: onCreateTap),
    );
  }
}
