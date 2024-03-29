import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.formKey,
    required this.textButton,
    required this.colorText,
    required this.colorButton,
    required this.onPressed,
    this.traillingIcon,
    this.leadingIcon,
    this.textAlign,
    this.fontWeight,
    this.fontSize,
  });

  final GlobalKey<FormBuilderState>? formKey;

  final Widget? leadingIcon, traillingIcon;
  final String textButton;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color colorText, colorButton;
  final FontWeight? fontWeight;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          backgroundColor: colorButton,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leadingIcon != null) leadingIcon ?? const SizedBox.shrink(),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                textAlign: textAlign ?? TextAlign.center,
                textButton,
                style: TextStyle(
                  fontSize: fontSize ?? 16,
                  color: colorText,
                  fontWeight: fontWeight ?? FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            if (traillingIcon != null) traillingIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
