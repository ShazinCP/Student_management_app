import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/model/bus_studentslist_model.dart';
import 'package:student_management/model/class_studentslist_model.dart';
import 'package:student_management/services/bus_studentlist_services.dart';
import 'package:student_management/services/class_studentslist_services.dart';
import 'package:student_management/view/paymentDetails/payment_details_screen.dart';
import 'package:student_management/view/bus_studentList/widgets/searchfield.dart';

class BusStudentsScreen extends StatelessWidget {
  const BusStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: cBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SearchFieldWidget(),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
                      'Bus STUDENT LIST',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: cWhiteColor),
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
                  child: FutureBuilder<List<BusStudentsListModel>?>(
          future: BusStudentsListServices().fetchBusStudentsList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildShimmerEffect();
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              final classStudentsList = snapshot.data!;
              return ListView.builder(
                itemCount: classStudentsList.length,
                itemBuilder: (context, index) {
                  final student = classStudentsList[index];
                  return Card(
                    color: Colors.blue, // Replace cPrimaryColor with a real color
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey, // Replace cSecondaryColor with a real color
                        child: Text(
                          student.user.name[0], // First letter of student's name
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        student.user.name,
                        style: TextStyle(
                          color: Colors.white, // Replace cWhiteColor with a real color
                        ),
                      ),
                    ),
                  );
                },
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

Widget _buildShimmerEffect() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.5),
          highlightColor: Colors.white38,
          child: Card(
            color: cPrimaryColor,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              title: Container(
                width: double.infinity,
                height: 10.0,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
        );
      },
    );
  }


