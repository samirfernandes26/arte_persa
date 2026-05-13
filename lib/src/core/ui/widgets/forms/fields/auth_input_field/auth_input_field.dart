import 'package:arte_persa/src/core/ui/widgets/components/auth_styles/auth_styles.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AuthStyles.fieldRadius),
      borderSide: const BorderSide(
        color: AuthStyles.fieldBorderColor,
        width: 1.4,
      ),
    );

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(
        fontSize: 16,
        color: AuthStyles.fieldTextColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AuthStyles.fieldHintColor,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 6, right: 2),
          child: Icon(icon, color: AuthStyles.fieldBorderColor, size: 24),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 46),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.88),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(
            color: AuthStyles.fieldBorderColor,
            width: 1.8,
          ),
        ),
        errorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: AuthStyles.errorBorderColor,
            width: 1.4,
          ),
        ),
        focusedErrorBorder: border.copyWith(
          borderSide: const BorderSide(
            color: AuthStyles.errorBorderColor,
            width: 1.8,
          ),
        ),
      ),
    );
  }
}
