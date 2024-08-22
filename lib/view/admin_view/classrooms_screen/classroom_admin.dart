import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/classroomlists_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/model/classroomlist_model.dart';
import 'package:student_management/view/common/students_info/students_info.dart';
import 'package:student_management/widgets/uppercase.dart';

class AdminClassrooms extends StatelessWidget {
  final String className;
  final String division;
  final List<Student> students;

  const AdminClassrooms({
    super.key,
    required this.className,
    required this.division,
    required this.students,
  });

  @override
  Widget build(BuildContext context) {
    final studentsProvider = Provider.of<ClassroomListsProvider>(context);
    return Scaffold(
      backgroundColor: cSecondaryColor,
      body: Column(
        children: [
          cHeight10,
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 360,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: cGreyColor,
                        offset: Offset(0, 2),
                        blurRadius: 2,
                      ),
                    ],
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      cHeight6,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: cWhiteColor,
                              ),
                            ),
                            Text(
                              '$className $division',
                              style: const TextStyle(
                                color: cWhiteColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            cWidth48,
                          ],
                        ),
                      ),
                      cHeight10,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(
                          onChanged: studentsProvider.setAdminSearchQuery,
                          controller: studentsProvider.adminSearchController,
                          style: const TextStyle(color: cBlackColor),
                          cursorColor: cPrimaryColor,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(
                                color: cBlackColor,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              borderSide: BorderSide(
                                color: cBlackColor,
                              ),
                            ),
                            fillColor: cWhiteColor,
                            filled: true,
                            hintText: 'Search Student...',
                            hintStyle: TextStyle(
                              color: cGreyColorWithShade700,
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              size: 22,
                              color: cGreyColorWithShade700,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                studentsProvider.adminSearchController.clear();
                                studentsProvider.setAdminSearchQuery("");
                              },
                              icon: const Icon(CupertinoIcons.clear),
                              iconSize: 19,
                              color: cGreyColorWithShade700,
                            ),
                          ),
                        ),
                      ),
                      cHeight15,
                    ],
                  ),
                ),
              ),
            ],
          ),
          cHeight15,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Divider(
              height: 2,
              color: cBlackColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              children: [
                Text(
                  'Class teacher: Seenath',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: cBlackColor),
                ),
              ],
            ),
          ),
          Consumer<ClassroomListsProvider>(builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (provider.errorMessage != null) {
              return Center(child: Text('Error: ${provider.errorMessage}'));
            } else if (students.isEmpty) {
              return const Center(
                child: Text(
                  'No students found',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              );
            } else {
              final classStudentsList = students
                  .where((student) => student.user.name
                      .toLowerCase()
                      .contains(provider.adminSearchQuery.toLowerCase()))
                  .toList();

              if (classStudentsList.isEmpty) {
                return const Center(child: Text("No student found"));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: classStudentsList.length,
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
                              builder: (context) => StudentsInfoScreen(
                                id: classStudentsList[index].id,
                                name: classStudentsList[index].user.name,
                                admissionNo:
                                    classStudentsList[index].admissionNo,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: cPrimaryColor,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: cSecondaryColor,
                              child: Text(
                                classStudentsList[index].admissionNo,
                                style: const TextStyle(
                                  fontSize: 8.5,
                                  color: cBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            title: Text(
                              classStudentsList[index].user.name.capitalize(),
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
          }),
        ],
      ),
    );
  }
}
