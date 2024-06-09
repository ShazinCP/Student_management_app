import 'package:flutter/material.dart';
import 'package:student_management/services/login_services.dart';

class LoginProvider extends ChangeNotifier{
TextEditingController usernameController=TextEditingController();
TextEditingController passwordController=TextEditingController();

  //-------------post Login------------------
  
  LoginServices loginServices =LoginServices();
 Future<void>loginAndGetToken() async {
      await loginServices.getToken(usernameController.text,passwordController.text);
      notifyListeners();
  }
}