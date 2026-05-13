import 'package:arte_persa/src/core/ui/widgets/components/painel_styles/painel_styles.dart';
import 'package:flutter/material.dart';

class CadastroSelectField<T> extends StatelessWidget {
  const CadastroSelectField({
    super.key,
    required this.value,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.validator,
  });

  final T? value;
  final String hintText;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(
        color: Color(0xFFCBAE8D),
        width: 1.2,
      ),
    );

    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      icon: const Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(
          Icons.arrow_drop_down_rounded,
          size: 42,
          color: Color(0xFFC3A17B),
        ),
      ),
      isExpanded: true,
      style: const TextStyle(
        fontSize: 17,
        color: PainelStyles.textPrimary,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: PainelStyles.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.96),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(
            color: PainelStyles.accentColor,
            width: 1.5,
          ),
        ),
        errorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Color(0xFFC55757),
            width: 1.3,
          ),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: Color(0xFFC55757),
            width: 1.5,
          ),
        ),
      ),
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(18),
    );
  }
}
