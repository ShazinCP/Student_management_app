import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/login_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/admin_view/home_admin.dart';
import 'package:student_management/view/auth/login_screen/widgets/textform_widget.dart';
import 'package:student_management/view/teacher_view/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: cSecondaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: cPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: Image.asset("assets/login_page/login.png"),
                  ),
                ),
                cHeight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 35),
                  child: Column(
                    children: [
                      LoginField(
                        controller: loginProvider.usernameController,
                        hintText: "username....",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          } else {
                            return null;
                          }
                        },
                      ),
                      cHeight20,
                      LoginField(
                        controller: loginProvider.passwordController,
                        hintText: "password...",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                cHeight50,
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CupertinoButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final loginSuccess = await loginProvider.loginAndGetToken();
                        if (loginSuccess && context.mounted) {
                          final sharedPref = await SharedPreferences.getInstance();
                          final role = sharedPref.getString('role');

                          navigateBasedOnRole(context, role, loginProvider.usernameController.text);
                        } else {
                          showErrorSnackbar(context);
                        }
                      } else {
                        print('Empty value');
                      }
                    },
                    color: cPrimaryColor,
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateBasedOnRole(BuildContext context, String? role, String username) {
    if (role == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminHomeScreen(userName: username),
        ),
      );
    } else if (role == 'teacher') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TeacherHomeScreen(userName: username),
        ),
      );
    } else {
      showErrorSnackbar(context);
    }
  }

  void showErrorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to login. Please try again.'),
      ),
    );
  }
}
