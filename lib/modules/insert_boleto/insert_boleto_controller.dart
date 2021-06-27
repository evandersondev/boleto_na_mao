import 'package:boletonamao/shared/models/boleto_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? "A data de vencimento não pode ser vazio" : null;
  String? validateValor(double value) =>
      value == 0 ? "Insira um valor maior que R\$ 0,00" : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? "O código do boleto não pode ser vazio" : null;

  void onChanged({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
        name: name, dueDate: dueDate, barcode: barcode, value: value);
  }

  Future<void> saveBoleto() async {
    final prefs = await SharedPreferences.getInstance();
    final boletos = prefs.getStringList('boletos') ?? <String>[];
    boletos.add(model.toJson());
    await prefs.setStringList('boletos', boletos);
    return;
  }

  Future<void> insertBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
