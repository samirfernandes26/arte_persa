import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

enum PainelSearchIconAlignment {
  leading,
  trailing,
}

class PainelSearchField extends StatelessWidget {
  const PainelSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.iconAlignment = PainelSearchIconAlignment.leading,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onChanged;
  final PainelSearchIconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    final icon = const Icon(
      Icons.search_rounded,
      size: 36,
      color: Color(0xFF8D7762),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFF1E7D9),
            Color(0xFFE8D8BF),
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
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: Color(0xFF5B4A3A),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF8E7B69),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: iconAlignment == PainelSearchIconAlignment.leading
              ? const Padding(
                  padding: EdgeInsets.only(left: 10, right: 2),
                  child: Icon(
                    Icons.search_rounded,
                    size: 36,
                    color: Color(0xFF8D7762),
                  ),
                )
              : null,
          suffixIcon: iconAlignment == PainelSearchIconAlignment.trailing
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: icon,
                )
              : null,
          prefixIconConstraints:
              iconAlignment == PainelSearchIconAlignment.leading
                  ? const BoxConstraints(minWidth: 58)
                  : null,
          suffixIconConstraints:
              iconAlignment == PainelSearchIconAlignment.trailing
                  ? const BoxConstraints(minWidth: 58)
                  : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}
