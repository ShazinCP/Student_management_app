import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/services/login_services.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginServices loginServices = LoginServices();

  Future<bool> loginAndGetToken() async {
    try {
      final response = await loginServices.getToken(
          usernameController.text, passwordController.text);
      if (response.isNotEmpty) {
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('accessToken', response['token']);
        await sharedPref.setString('username', usernameController.text);
        await sharedPref.setString('role', response['role']);
        return true;
      } else {
        print('Failed to retrieve login response');
        return false;
      }
    } catch (e) {
      print('Failed to login: $e');
      return false;
    }
  }
}
