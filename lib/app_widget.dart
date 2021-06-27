import 'package:boletonamao/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:boletonamao/modules/insert_boleto/insert_boleto_page.dart';
import 'package:boletonamao/modules/splash/splash_page.dart';
import 'package:boletonamao/shared/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BoletoNaMão',
      theme: ThemeData(
        primarySwatch: AppColors.primary,
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/home': (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        '/login': (context) => const LoginPage(),
        '/barcode_scanner': (context) => const BarcodeScannerPage(),
        '/insert_boleto': (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
    );
  }
}
