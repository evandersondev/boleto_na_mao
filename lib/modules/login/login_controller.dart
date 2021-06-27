import 'package:boletonamao/shared/auth/auth_controller.dart';
import 'package:boletonamao/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoUrl: response.photoUrl,
      );

      authController.setUser(context, user);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
