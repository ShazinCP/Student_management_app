import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/bus_studentsprovider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/students_info/students_info.dart';
import 'package:student_management/widgets/lists_shimmer_effect.dart';

class BusStudentsScreen extends StatelessWidget {
  const BusStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final busstudentsPro = Provider.of<BusStudentsProvider>(context);
    return Scaffold(
      backgroundColor: cSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            cHeight40,
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 360,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: cWhiteColor,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                      color: cPrimaryColor,
                      borderRadius: BorderRadius.all(
                       Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: TextField(
                            onChanged:busstudentsPro.setSearchQuery ,
                            controller: busstudentsPro.searchController,
                            style: const TextStyle(color: cBlackColor),
                            cursorColor: cPrimaryColor,
                            decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  borderSide: BorderSide(
                                    color: cWhiteColor,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    borderSide: BorderSide(
                                      color: cWhiteColor,
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
                                  onPressed: (){
                                    busstudentsPro.searchController.clear();
                                     busstudentsPro.setSearchQuery("");
                                  },
                                 icon: const Icon(CupertinoIcons.clear),
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
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Student List',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: cBlackColor,
                      ),
                    ),
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
              child: Consumer<BusStudentsProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return buildListShimmerEffect();
                  } else if (provider.errorMessage != null) {
                    return Center(
                        child: Text('Error: ${provider.errorMessage}'));
                  } else if (provider.students == null) {
                    return const Center(child: Text('No data available'));
                  } else {
                       final busStudentsList = provider.students!
                        .where((students) =>
                       students.user.name.toLowerCase().contains(provider.searchQuery.toLowerCase()))
                        .toList();
                    return RefreshIndicator(
                      onRefresh: provider.fetchBusStudents,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: busStudentsList.length,
                        itemBuilder: (context, index) {
                          final student = busStudentsList[index];
                      
                          return Card(
                            color: cPrimaryColor,
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StudentsInfoScreen(
                                  name: student.user.name,
                                  gender: student.user.gender,
                                  id: student.user.id,
                                ),
                              )),
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
    );
  }
}
