import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/addscreen_provider.dart';
import 'package:student_management/controller/login_provider.dart';
import 'package:student_management/controller/paymentdetails_provider.dart';
import 'package:student_management/controller/studentlist_provider.dart';
import 'package:student_management/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddScreenProvider()),
        ChangeNotifierProvider(create: (context) => StudenListProvider()),
        ChangeNotifierProvider(create: (context) => PaymentDetailsProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MaterialApp(
        title: 'Student Management',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
