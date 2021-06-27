import 'package:boletonamao/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:boletonamao/shared/themes/app_colors.dart';
import 'package:boletonamao/shared/themes/app_text_styles.dart';
import 'package:boletonamao/shared/widgets/input_text.dart/input_text_widget.dart';
import 'package:boletonamao/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class InsertBoletoPage extends StatefulWidget {
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  final String? barcode;

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: 'R\$', decimalSeparator: ',');
  final duaDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(
          color: AppColors.input,
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () => Navigator.pop(context),
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: () async {
          await controller.insertBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 73, vertical: 24),
              child: Text(
                'Preencha os dados do boleto',
                textAlign: TextAlign.center,
                style: TextStyles.titleBoldHeading,
              ),
            ),
            const SizedBox(height: 24),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  InputTextWidget(
                    label: 'Nome do boleto',
                    icon: Icons.description_outlined,
                    validator: controller.validateName,
                    onChanged: (value) {
                      controller.onChanged(name: value);
                    },
                  ),
                  InputTextWidget(
                    label: 'Vencimento',
                    controller: duaDateInputTextController,
                    icon: FontAwesomeIcons.timesCircle,
                    validator: controller.validateVencimento,
                    onChanged: (value) {
                      controller.onChanged(dueDate: value);
                    },
                  ),
                  InputTextWidget(
                    label: 'Valor',
                    icon: FontAwesomeIcons.wallet,
                    controller: moneyInputTextController,
                    validator: (_) => controller
                        .validateValor(moneyInputTextController.numberValue),
                    onChanged: (value) {
                      controller.onChanged(
                          value: moneyInputTextController.numberValue);
                    },
                  ),
                  InputTextWidget(
                    label: 'Código',
                    icon: FontAwesomeIcons.barcode,
                    controller: barcodeInputController,
                    validator: controller.validateCodigo,
                    onChanged: (value) {
                      controller.onChanged(barcode: value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
