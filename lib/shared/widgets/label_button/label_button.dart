import 'package:boletonamao/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  const LabelButton(
      {Key? key, required this.label, required this.onPressed, this.styles})
      : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final TextStyle? styles;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: TextButton(
          onPressed: onPressed,
          child: Text(label, style: styles ?? TextStyles.buttonHeading)),
    );
  }
}
