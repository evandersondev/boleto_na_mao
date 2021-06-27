import 'package:boletonamao/shared/themes/app_colors.dart';
import 'package:boletonamao/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.controller,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          TextFormField(
            style: TextStyles.input,
            initialValue: initialValue,
            validator: validator,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: label,
              labelStyle: TextStyles.input,
              border: InputBorder.none,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.stroke,
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
        ],
      ),
    );
  }
}
