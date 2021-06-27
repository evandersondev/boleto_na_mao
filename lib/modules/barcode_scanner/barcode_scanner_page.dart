import 'dart:async';

import 'package:boletonamao/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:boletonamao/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:boletonamao/shared/themes/app_colors.dart';
import 'package:boletonamao/shared/themes/app_text_styles.dart';
import 'package:boletonamao/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:boletonamao/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:boletonamao/shared/widgets/label_button/label_button.dart';
import 'package:boletonamao/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushNamed(context, '/insert_boleto',
            arguments: controller.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.black,
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: TextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                  onPressed: () => controller.dispose(),
                ),
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnPressed: () async {
                  controller.dispose();
                  await Navigator.pushNamed(context, '/insert_boleto');
                },
                secondaryLabel: 'Adicionar da galeria',
                secondaryOnPressed: () {},
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.7),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.7),
                  )),
                ],
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: 'Não foi possível identificar um código de barras.',
                    subtitle:
                        'Tente escanear novamente ou digite o código do seu boleto.',
                    primaryLabel: 'Escanear novamente',
                    primaryOnPressed: () {
                      controller.scanWithCamera();
                    },
                    secondaryLabel: 'Digitar código',
                    secondaryOnPressed: () async {
                      controller.dispose();
                      await Navigator.pushNamed(context, '/insert_boleto');
                    },
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
