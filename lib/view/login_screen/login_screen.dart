import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/login_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/view/home_screen/home_screen.dart';
import 'package:student_management/view/login_screen/widgets/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: size.height * 0.4,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: cPrimaryColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // Changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/login_page/login.png",
                      ),
                    ),
                  ),
                  cHeight20,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 35),
                    child: Column(
                      children: [
                        Loginfield(
                          controller: loginProvider.usernameController,
                          hintText: "User Name....",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username ';
                            } else {
                              return null;
                            }
                          },
                        ),
                        cHeight20,
                        Loginfield(
                            controller: loginProvider.passwordController,
                            hintText: "Password...",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              } else {
                                return null;
                              }
                            }),
                      ],
                    ),
                  ),
                  cHeight50,
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(
                             
                              0, 3), // Changes the position of the shadow
                          ),
                      ],
                      borderRadius: BorderRadius.circular(
                          8), // Match the button's shape if needed
                    ),
                    child: CupertinoButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          await loginProvider.loginAndGetToken();
                          final token = await readToken();
                          if (token != null && token.isNotEmpty) {
                            // Store the username in shared preferences
                            final sharedPref = await SharedPreferences.getInstance();
                            await sharedPref.setString('username', loginProvider.usernameController.text);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                  userName: loginProvider.usernameController.text,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Failed to login. Please try again.'),
                              ),
                            );
                          }
                        } else {
                          print('empty value');
                        }
                      },
                      color: cPrimaryColor,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
