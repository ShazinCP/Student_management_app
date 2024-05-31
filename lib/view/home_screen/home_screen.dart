import 'package:flutter/material.dart';

import 'package:student_management/helper/colors.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/view/home_screen/widgets/home_center_widget.dart';
import 'package:student_management/view/home_screen/widgets/home_top_widget.dart';
import 'package:student_management/view/login_screen/login_screen.dart';
import 'package:student_management/view/studentList/studentlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await clearToken();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
          Container(
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              color: cBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow color
                  spreadRadius: 7, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: Offset(0, 5), // Offset in x and y directions
                ),
              ],
            ),
            child: HomeTopWidget(
              name: "Shahal",
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 5,
              color: Colors.grey.shade700,
              thickness: 3,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeCenterWidget(
                onTap: () {},
                image: "assets/home_page/home_classroom.png",
                text: "class room",
              ),
              HomeCenterWidget(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentListScreen(),
                      ));
                },
                image: "assets/home_page/home_school_bus.jpg",
                text: "manage bus",
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: size.height / 7,
            width: size.width / 1.1,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset in x and y directions
                  ),
                ],
                color: cPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          )
        ],
      ),
    );
  }
}
