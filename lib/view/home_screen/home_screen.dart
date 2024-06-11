import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/login_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/view/class_studentlist/class_studentlist_screen.dart';
import 'package:student_management/view/home_screen/widgets/home_center_widget.dart';
import 'package:student_management/view/home_screen/widgets/home_top_widget.dart';
import 'package:student_management/view/login_screen/login_screen.dart';
import 'package:student_management/view/bus_studentList/bus_studentlist_screen.dart';
import 'package:student_management/widgets/uppercase.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
      ),
      drawer: Drawer(
        child: ListView(
          // Add your drawer menu items here
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: cPrimaryColor,
              ),
              child: Text('Student Management App'),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                // Handle profile navigation
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // Handle settings navigation
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () async {
                  await clearToken();
                  Provider.of<LoginProvider>(context,listen: false).passwordController.clear();
                   Provider.of<LoginProvider>(context,listen: false).usernameController.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                color: cBackgroundColor,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.5),
                //     spreadRadius: 7,
                //     blurRadius: 7,
                //     offset: const Offset(0, 5),
                //   ),
                // ],
              ),
              child: HomeTopWidget(
                name: userName.capitalize(),
              ),
            ),
            cHeight40,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 5,
                color: Colors.grey.shade700,
                thickness: 3,
              ),
            ),
            cHeight40,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCenterWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClassStudentsScreen(),
                        ));
                  },
                  image: "assets/home_page/home_classroom.png",
                  text: "class room",
                ),
                HomeCenterWidget(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BusStudentsScreen(),
                        ));
                  },
                  image: "assets/home_page/home_school_bus.jpg",
                  text: "manage bus",
                ),
              ],
            ),
            cHeight50,
            Container(
              height: size.height / 7,
              width: size.width / 1.1,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset:
                          const Offset(0, 3), // Offset in x and y directions
                    ),
                  ],
                  color: cPrimaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
            )
          ],
        ),
      ),
    );
  }
}
