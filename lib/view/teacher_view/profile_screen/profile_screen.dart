import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cSecondaryColor,
      appBar: AppBar(
        title: const Text('Profile',style: TextStyle(color: cWhiteColor,fontWeight: FontWeight.w700,),),
        backgroundColor: cPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit,color: cWhiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/workspace-desk-work-laptop-thumbnail.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Mufees Rahman',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'mufeesrehma22@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF545353),
                ),
              ),
            ),
            const SizedBox(height: 35),
            // const Divider(),
            const ListTile(
              leading: Icon(Icons.numbers),
              title: Text('Permanent Number'),
              subtitle: Text('65432'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Short Name'),
              subtitle: Text('MS'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+91 987654321'),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                'assets/6648537-removebg-preview.png',
                width: 24,
                height: 24,
              ),
              title: const Text('Gender'),
              subtitle: const Text('Male'),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
