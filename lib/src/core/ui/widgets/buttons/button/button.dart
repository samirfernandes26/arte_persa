import 'package:flutter/material.dart';

abstract class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.textButton,
    required this.colorText,
    required this.colorButton,
    required this.onPressed,
    this.traillingIcon,
    this.leadingIcon,
    this.textAlign,
    this.fontWeight,
    this.fontSize,
    this.useFlexible = false,
    this.minimumSize,
  });

  Widget body();

  final Widget? leadingIcon, traillingIcon;
  final String textButton;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color colorText, colorButton;
  final FontWeight? fontWeight;
  final bool useFlexible;
  final Size? minimumSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return body();
  }
}

class Button extends BaseButton {
  const Button({
    Key? key,
    required String textButton,
    required Color colorText,
    required Color colorButton,
    required Function() onPressed,
    Widget? traillingIcon,
    Widget? leadingIcon,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    double? fontSize,
    bool useFlexible = false,
    Size? minimumSize,
  }) : super(
          key: key,
          textButton: textButton,
          colorText: colorText,
          colorButton: colorButton,
          onPressed: onPressed,
          traillingIcon: traillingIcon,
          leadingIcon: leadingIcon,
          textAlign: textAlign,
          fontWeight: fontWeight,
          fontSize: fontSize,
          useFlexible: useFlexible,
          minimumSize: minimumSize,
        );

  @override
  Widget body() {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minimumSize ?? const Size.fromHeight(48),
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
              textButton,
              textAlign: textAlign ?? TextAlign.center,
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
    );

    if (useFlexible) {
      return Flexible(
        child: button,
      );
    }
    return button;
  }
}
