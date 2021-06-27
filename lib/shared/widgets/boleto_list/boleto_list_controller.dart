import 'package:boletonamao/shared/models/boleto_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController() {
    geBoletos();
  }

  Future<void> geBoletos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = prefs.getStringList('boletos') ?? <String>[];
      boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }
}
