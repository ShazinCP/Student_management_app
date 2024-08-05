import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/classroomlists_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/model/classroomlist_model.dart';
import 'package:student_management/view/admin_view/classroom_admin.dart';
import 'package:student_management/view/teacher_view/profile_screen/profile_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  final String userName;
  const AdminHomeScreen({super.key, required this.userName});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cSecondaryColor,
      appBar: AppBar(
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
        child: ListView(
          // Add your drawer menu items here
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: cPrimaryColor,
              ),
              child: Text(
                'Student Management App',
                style: TextStyle(color: cSecondaryColor),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                // Handle profile navigation
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    )); // Close drawer
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
                  // await clearToken();
                  // Provider.of<LoginProvider>(context, listen: false)
                  //     .passwordController
                  //     .clear();
                  // Provider.of<LoginProvider>(context, listen: false)
                  //     .usernameController
                  //     .clear();
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginScreen()),
                  // );
                }),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  buildClassLevelButton('8'),
                  const SizedBox(width: 14),
                  buildClassLevelButton('9'),
                  const SizedBox(width: 14),
                  buildClassLevelButton('10'),
                  const SizedBox(width: 14),
                  buildClassLevelButton('11'),
                  const SizedBox(width: 14),
                  buildClassLevelButton('12'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer<ClassroomListsProvider>(
              builder: (context, provider, child) {
                List<ClassroomLists>? classes = provider.classrooms;
                if (classes == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    return buildClassCard(classes[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildClassLevelButton(
    String classLevel,
  ) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black87,
          backgroundColor: cWhiteColor3,
        ),
        child: Text(
          classLevel,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildClassCard(ClassroomLists classroom) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminClassrooms(
            className: classroom.name,
            division: classroom.division,
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              Container(
                height: 35,
                width: 56,
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
              const SizedBox(height: 4.2),
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
