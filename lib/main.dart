import 'package:flutter/material.dart';
import 'package:student_management/view/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Student Management',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}