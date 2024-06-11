import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/class_studentsprovider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/widgets/lists_shimmer_effect.dart';

class ClassStudentsScreen extends StatelessWidget {
  const ClassStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classstudentPro=Provider.of<ClassStudentsProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              cHeight10,
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 350,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: cShadowColor,
                            offset: Offset(0, 2),
                            blurRadius: 2,
                          ),
                        ],
                        color: cPrimaryColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(45),
                          topLeft: Radius.circular(45),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                         Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextField(
                                onChanged:classstudentPro.setSearchQuery ,
                                        controller: classstudentPro.searchController,
                                        style: const TextStyle(color: cBlackColor),
                                        cursorColor: cPrimaryColor,
                                        decoration: InputDecoration(
                                            enabledBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(14)),
                                              borderSide: BorderSide(
                                                color: cBlackColor,
                                              ),
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(14)),
                                                borderSide: BorderSide(
                                                  color: cBlackColor,
                                                )),
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
                                                classstudentPro.searchController.clear();
                                                classstudentPro.setSearchQuery("");
                                              },
                                             icon: Icon(CupertinoIcons.clear) ,
                                              iconSize: 19,
                                              color: cGreyColorWithShade700,
                                            )),
                                      ),
                          ),
                          cHeight15,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              cHeight10,
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
                      'Student List',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: cBlackColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 12,
                ),
                child: Consumer<ClassStudentsProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return buildListShimmerEffect();
                    } else if (provider.errorMessage != null) {
                      return Center(child: Text('Error: ${provider.errorMessage}'));
                    } else if (provider.students == null) {
                      return const Center(child: Text('No data available'));
                    } else {

                       final classStudentsList = provider.students!
                          .where((students) =>
                         students.user.name!.toLowerCase().contains(provider.searchQuery.toLowerCase()))
                          .toList();
                      return RefreshIndicator(
                        onRefresh: provider.fetchClassStudents,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: classStudentsList.length,
                          itemBuilder: (context, index) {
                            final student = classStudentsList[index];
                        
                            return Card(
                              color: cPrimaryColor,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: cSecondaryColor,
                                  child: Text(
                                    student.user.gender,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  student.user.name,
                                  style: const TextStyle(
                                    color: cWhiteColor,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
