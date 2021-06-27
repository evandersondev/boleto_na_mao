import 'package:boletonamao/shared/themes/app_colors.dart';
import 'package:boletonamao/shared/themes/app_text_styles.dart';
import 'package:boletonamao/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed})
      : super(key: key);

  final String title;
  final String subtitle;
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.6),
                )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(
                        TextSpan(
                            text: title,
                            style: TextStyles.buttonBoldPrimary,
                            children: [
                              TextSpan(
                                  text: '\n$subtitle',
                                  style: TextStyles.buttonHeading)
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(
                      color: AppColors.stroke,
                      thickness: 1,
                      height: 0,
                    ),
                    SetLabelButtons(
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secondaryLabel: secondaryLabel,
                      secondaryOnPressed: secondaryOnPressed,
                      enablePrimaryColor: true,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
