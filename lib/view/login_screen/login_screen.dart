import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/view/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 214, 237, 255),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
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
                    loginfield(),
                    SizedBox(
                      height: 10,
                    ),
                    loginfield(),
                  ],
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
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
    );
  }
}

class loginfield extends StatelessWidget {
  const loginfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
          borderRadius: BorderRadius.all(
              Radius.circular(15)), // Set the border radius here
        ),
        hintText: "User Name....",
      ),
    );
  }
}
