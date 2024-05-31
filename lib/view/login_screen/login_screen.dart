// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/home_screen/home_screen.dart';
import 'package:student_management/view/login_screen/widgets/textform_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
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
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 35),
                  child: Column(
                    children: [
                      loginfield(
                        text: "User Name...",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      loginfield(
                        text: "Password...",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
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
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
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
    );
  }
}
