import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/login_provider.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/services/login_services.dart';
import 'package:student_management/view/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

 
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    final loginProvider=Provider.of<LoginProvider>(context);
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 214, 237, 255),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      child: Image.asset(
                        "assets/login_page/login.png",
                      ),
                      height: size.height * 0.4,
                      width: size.width / 1.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 134, 182, 246),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 35),
                    child: Column(
                      children: [
                        loginfield(
                          controller: loginProvider.usernameController,
                        hintText: "User Name....",
                        validator:(value) {
                      if (value!.isEmpty) {
                        return 'Please enter username ';
                      } else {
                        return null;
                      }
                    } ,),
                        SizedBox(
                          height: 10,
                        ),
                        loginfield(
                          controller: loginProvider.passwordController,
                        hintText: "Password...",
                            validator:(value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        return null;
                      }
                    } 
                        ),
                      ],
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                    await loginProvider.loginAndGetToken();
                    final token = await readToken();
                    if (token != null && token.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to login. Please try again.'),
                        ),
                      );
                    }
                      }else{
                         print('empty value');
                      }
                  },
                    color: Colors.blue,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
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

class loginfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
   loginfield({
    super.key,
    required this.controller,
    required this.hintText, this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller:controller ,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.all(
              Radius.circular(15)), // Set the border radius here
        ),
        hintText: hintText,
      ),
    );
  }
}
