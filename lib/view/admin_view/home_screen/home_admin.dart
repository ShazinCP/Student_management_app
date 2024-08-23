// ignore_for_file: use_build_context_synchronously

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/classroomlists_provider.dart';
import 'package:student_management/controller/login_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/helper/readandset_token.dart';
import 'package:student_management/model/classroomlist_model.dart';
import 'package:student_management/view/admin_view/classrooms_screen/classroom_admin.dart';
import 'package:student_management/view/auth/login_screen/login_screen.dart';
import 'package:student_management/view/teacher_view/profile_screen/profile_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  final String userName;
  const AdminHomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: cSecondaryColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: cWhiteColor),
          backgroundColor: cPrimaryColor,
          title: const Text(
            'KKMHSS CHEAKODE',
            style: TextStyle(
              color: cWhiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: cSecondaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: cWhiteColor,
                ),
                child: Column(
                  children: [
                    const Text(
                      'KKMHSS CHEAKODE',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFF2d295b),
                      ),
                    ),
                    Image.asset(
                      "assets/splash_page/school_logo.png",
                      height: 110,
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: const Icon(
                  Icons.account_circle,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ));
                },
              ),
              cHeight5,
              ListTile(
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: const Icon(
                  Icons.settings,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              cHeight5,
              ListTile(
                title: const Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                ),
                onTap: () async {
                  // Show confirmation dialog
                  bool? confirmLogout = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        content:
                            const Text('Are you sure you want to logout?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: cPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                color: cPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
              
                  if (confirmLogout ?? false) {
                    await clearToken();
                    Provider.of<LoginProvider>(context, listen: false)
                        .passwordController
                        .clear();
                    Provider.of<LoginProvider>(context, listen: false)
                        .usernameController
                        .clear();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            cHeight10,
            ButtonsTabBar(
              backgroundColor: cPrimaryColor,
              unselectedBackgroundColor: cWhiteColor3,
              contentPadding: EdgeInsets.symmetric(
                horizontal:
                    size.width * 0.1, // Adjust padding based on screen width
              ),
              tabs: const [
                Tab(text: '8'),
                Tab(text: '9'),
                Tab(text: '10'),
                Tab(text: '11'),
                Tab(text: '12'),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ClassLevelView(classLevel: '8'),
                  ClassLevelView(classLevel: '9'),
                  ClassLevelView(classLevel: '10'),
                  ClassLevelView(classLevel: '11'),
                  ClassLevelView(classLevel: '12'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClassLevelView extends StatelessWidget {
  final String classLevel;

  const ClassLevelView({super.key, required this.classLevel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ClassroomListsProvider>(
      builder: (context, provider, child) {
        List<ClassroomLists>? classes = provider.classrooms;

        if (provider.isLoading) {
          // Use shimmer effect during loading
          return buildShimmerEffect(context);
        } else if (provider.errorMessage != null) {
          return Center(child: Text('Error: ${provider.errorMessage}'));
        } else if (classes == null || classes.isEmpty) {
          return const Center(child: Text("No classes added"));
        } else {
          // Filter classrooms based on the selected class level
          List<ClassroomLists> filteredClasses = classes
              .where((classroom) => classroom.name == classLevel)
              .toList();

          if (filteredClasses.isEmpty) {
            return const Center(child: Text("No classes for this level"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  size.width > 600 ? 4 : 3, // Adjust based on screen width
              crossAxisSpacing:
                  size.width * 0.02, // Adjust spacing based on screen width
              mainAxisSpacing:
                  size.width * 0.02, // Adjust spacing based on screen width
              childAspectRatio: size.width > 600
                  ? 1.4
                  : 1.2, // Adjust aspect ratio based on screen width
            ),
            itemCount: filteredClasses.length,
            itemBuilder: (context, index) {
              return buildClassCard(context, filteredClasses[index]);
            },
          );
        }
      },
    );
  }

  Widget buildShimmerEffect(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: size.width > 600 ? 4 : 3,
        crossAxisSpacing: size.width * 0.02,
        mainAxisSpacing: size.width * 0.02,
        childAspectRatio: size.width > 600 ? 1.4 : 1.2,
      ),
      itemCount: 25, // Number of shimmer items
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.white38,
          child: Card(
            color: cPrimaryColor,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.01),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.2,
                    decoration: const BoxDecoration(
                      color: cWhiteColor2,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildClassCard(BuildContext context, ClassroomLists classroom) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminClassrooms(
            className: classroom.name,
            division: classroom.division,
            classTeacher: classroom.classTeacher,
            students: classroom.students,
          ),
        ),
      ),
      child: Card(
        color: cPrimaryColor,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.02), // Adjust padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.01), // Adjust height
              Container(
                height: size.height * 0.05, // Adjust height
                width: size.width * 0.2, // Adjust width
                decoration: const BoxDecoration(
                  color: cWhiteColor2,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    '${classroom.name}${classroom.division}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01), // Adjust height
              Text(
                'Students: ${classroom.students.length}',
                style: const TextStyle(
                  fontSize: 9,
                  color: cWhiteColor,
                ),
              ),
              Text(
                'Total seats: ${classroom.capacity}',
                style: const TextStyle(
                  fontSize: 6.5,
                  color: cGreyColor2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
