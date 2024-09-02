import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/controller/profile_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/model/profile_model.dart';
import 'package:student_management/widgets/uppercase.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cSecondaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: cWhiteColor,
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: cWhiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: cPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: cWhiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading) {
                return const Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (provider.errorMessage != null) {
                return Center(
                  child: Text("Error: ${provider.errorMessage}"),
                );
              } else if (provider.profiles != null &&
                  provider.profiles!.isNotEmpty) {
                Profile user = provider.profiles!.first;
                Profile profile = provider.profiles!.last;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/profile_page/workspace-desk-work-laptop-thumbnail.jpg'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.user.name.capitalize(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
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
                    ListTile(
                      leading: const Icon(Icons.numbers),
                      title: const Text('Permanent Number'),
                      subtitle:  Text(profile.penNo),
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
                        'assets/profile_page/6648537-removebg-preview.png',
                        width: 24,
                        height: 24,
                      ),
                      title: const Text('Gender'),
                      subtitle: Text(user.user.gender),
                    ),
                    const Divider(),
                  ],
                );
              } else {
                return const Center(
                  child: Text('No profile available.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
