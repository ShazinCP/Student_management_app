import 'package:flutter/material.dart';
import 'package:student_management/services/login_services.dart';

class AdminLoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //-------------post Login------------------

  LoginServices adminLoginServices = LoginServices();
  Future<void> loginAndGetToken() async {
    await adminLoginServices.getToken(
        usernameController.text, passwordController.text);
    notifyListeners();
  }
}
