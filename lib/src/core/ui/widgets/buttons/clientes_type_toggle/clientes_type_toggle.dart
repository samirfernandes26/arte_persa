import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:arte_persa/src/screens/clientes/clientes_mock_data.dart';
import 'package:flutter/material.dart';

class ClientesTypeToggle extends StatelessWidget {
  const ClientesTypeToggle({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  final ClienteCategory selectedCategory;
  final ValueChanged<ClienteCategory> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFE7D1AD),
            Color(0xFFD7B57B),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: PainelStyles.shadowColor.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _ClientesTypeOption(
              label: 'PF (Pessoa Física)',
              selected: selectedCategory == ClienteCategory.pessoaFisica,
              onTap: () => onChanged(ClienteCategory.pessoaFisica),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: _ClientesTypeOption(
              label: 'PJ (Pessoa Jurídica)',
              selected: selectedCategory == ClienteCategory.pessoaJuridica,
              onTap: () => onChanged(ClienteCategory.pessoaJuridica),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClientesTypeOption extends StatelessWidget {
  const _ClientesTypeOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? Colors.white : Colors.transparent,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PainelStyles.textPrimary,
                fontSize: 16.5,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
