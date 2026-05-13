import 'package:arte_persa/src/core/ui/widgets/forms/fields/cadastro_text_field/cadastro_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroPhoneField extends StatelessWidget {
  const CadastroPhoneField({
    super.key,
    required this.label,
    required this.controller,
    required this.useWhatsApp,
    required this.onWhatsAppTap,
    this.validator,
    this.inputFormatters,
  });

  final String label;
  final TextEditingController controller;
  final bool useWhatsApp;
  final VoidCallback onWhatsAppTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CadastroTextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                validator: validator,
                inputFormatters: inputFormatters,
              ),
            ),
            const SizedBox(width: 14),
            _WhatsAppButton(
              active: useWhatsApp,
              onTap: onWhatsAppTap,
            ),
          ],
        ),
      ],
    );
  }
}

class _WhatsAppButton extends StatelessWidget {
  const _WhatsAppButton({
    required this.active,
    required this.onTap,
  });

  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: active ? const Color(0xFF2E7D32) : const Color(0xFFB6C7B7),
            border: Border.all(
              color: const Color(0xFFD8C2A5),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.phone_in_talk_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
