import 'package:flutter/material.dart';
import 'package:student_management/services/admin_services.dart';

class AdminLoginProvider extends ChangeNotifier {
  TextEditingController adminUsernameController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  //-------------post Login------------------

  AdminLoginServices adminLoginServices = AdminLoginServices();
  Future<void> loginAndGetToken() async {
    await adminLoginServices.getToken(
        adminUsernameController.text, adminPasswordController.text);
    notifyListeners();
  }
}
