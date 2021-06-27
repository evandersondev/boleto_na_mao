import 'package:boletonamao/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DividerVerticalWidget extends StatelessWidget {
  const DividerVerticalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
      child: null,
    );
  }
}
