import 'package:animated_card/animated_card.dart';
import 'package:boletonamao/shared/models/boleto_model.dart';
import 'package:boletonamao/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class BoletoTileWidget extends StatelessWidget {
  const BoletoTileWidget({Key? key, required this.data}) : super(key: key);

  final BoletoModel data;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${data.dueDate}',
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: 'R\$ ',
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: data.value!.toStringAsFixed(2),
                style: TextStyles.trailingBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
