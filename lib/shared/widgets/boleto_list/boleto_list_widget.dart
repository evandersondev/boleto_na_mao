import 'package:boletonamao/shared/models/boleto_model.dart';
import 'package:boletonamao/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:boletonamao/shared/widgets/boleto_tile/boleto_tile_widget.dart';
import 'package:flutter/material.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;

  const BoletoListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  State<BoletoListWidget> createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => Column(
        children: controller.boletos
            .map(
              (e) => BoletoTileWidget(
                data: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
