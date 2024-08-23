import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/admin_view/home_screen/home_admin.dart';
import 'package:student_management/view/auth/login_screen/login_screen.dart';
import 'package:student_management/view/teacher_view/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cSecondaryColor,
      body: Center(
        child: SizedBox(
          // width: double.infinity,
          // height: double.infinity,
          child: Image.asset(
            'assets/splash_page/school_logo.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPref.getString("accessToken");
    final username = sharedPref.getString("username");
    final role = sharedPref.getString("role");

    if (userLoggedIn == null || userLoggedIn.isEmpty) {
      navigateToLogin();
    } else {
      navigateToHomeScreen(role, username);
    }
  }

  Future<void> navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) =>  LoginScreen()),
    );
  }

  void navigateToHomeScreen(String? role, String? username) {
    if (!mounted) return;

    if (role == 'admin') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => AdminHomeScreen(userName: username ?? 'User')),
      );
    } else if (role == 'teacher') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => TeacherHomeScreen(userName: username ?? 'User')),
      );
    } else {
      navigateToLogin();
    }
  }
}
