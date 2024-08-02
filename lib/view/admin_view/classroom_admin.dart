import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/teacher_view/students_info/students_info.dart';

class AdminClassrooms extends StatelessWidget {
  AdminClassrooms({super.key});

  final List<String> students = [
    'Muhammed Shamil',
    'Muhammed Safvan',
    'Muhammed Ameer',
    'Ahmmad Salman',
    'Shazin Muhammed',
    'Shahal Rahman',
    'Mufees Rahman',
    'Muhammed Safvan',
    'Ahmmad Salman',
    'Shazin Muhammed',
    'Mufees Rahman',
    'Muhammed Ameer',
    'Muhammed Safvan',
    'Ahmmad Salman',
    'Muhammed Shamil',
    'Shazin Muhammed',
    'Mufees Rahman',
    'Muhammed Safvan',
    'Muhammed Ameer',
    'Ahmmad Salman',
    'Muhamed Anshad',
    'Shazin Muhammed',
    'Muhammed Ameer',
    'Muhammed Shamil',
    'Mufees Rahman',
    'Muhammed Safvan',
    'Muhammed Ameer',
    'Ahmmad Salman',
    'Shazin Muhammed',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cSecondaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: cWhiteColor),
        backgroundColor: cPrimaryColor,
        title: const Text(
          '10 A',
          style: TextStyle(
            color: cWhiteColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  StudentsInfoScreen(
                        id: 1,
                        name: 'Muhammed Shamil',
                        gender: 'M',
                      ),
                    ));
              },
              child: Card(
                color: cPrimaryColor,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: cWhiteColor,
                    child: Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        color: cBlackColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  title: Text(
                    students[index],
                    style: const TextStyle(
                      color: cWhiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
