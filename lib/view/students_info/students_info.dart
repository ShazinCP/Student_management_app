import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/studentinfo_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/paymentDetails/payment_details_screen.dart';
import 'package:student_management/view/students_info/widgets/busdetails_widget.dart';

class StudentsInfoScreen extends StatelessWidget {
  final int id;
  final String name;
  final String gender;

  const StudentsInfoScreen({
    super.key,
    required this.id,
    required this.name,
    required this.gender,
  });
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentInfoProvider>(context, listen: false);
    provider.fetchStudentInfo(id);
    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cPrimaryColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: cBackgroundColor,
                child: Text(
                  gender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            cHeight10,
            Text(
              name,
              style: const TextStyle(color: cWhiteColor),
            ),
          ],
        ),
      ),
      body: Consumer<StudentInfoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return _buildShimmerEffect();
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.studentInfo == null) {
            return const Center(child: Text("No data available"));
          }

          final student = provider.studentInfo!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cHeight25,
                  Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      color: cPrimaryColor,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: cBlackColor.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BusDetailsWidget(
                              contant: "Bus No",
                              count: student.bus.busNo.toString(),
                            ),
                            BusDetailsWidget(
                              contant: "Route No",
                              count: student.route.routeNo.toString(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Bus point :  ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              student.busPoint.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  cHeight20,
                  const Text(
                    "Bus Routes",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: cBlackColor,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: cBlackColor,
                      thickness: 2,
                    ),
                  ),
                  Container(
                      height: 350,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: provider.busPoints.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: cPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: cBlackColor.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    provider.busPoints[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: cWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  cHeight27,
                  Center(
                    child: SizedBox(
                      width: 190,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                   PaymentDetailsScreen(studentId:student.student.id,gender: gender,name: name,),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: cPrimaryColor,
                          elevation: 5,
                          shadowColor: Colors.black.withOpacity(0.5),
                        ),
                        child: const Text(
                          'Show Payment',
                          style: TextStyle(fontSize: 20, color: cWhiteColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
     ),
);
}



  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              cHeight25,
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              cHeight20,
              Container(
                height: 30,
                width: 150,
                color: Colors.grey.withOpacity(0.5),
              ),
              cHeight10,
              Divider(color: Colors.grey.withOpacity(0.5), thickness: 2),
              cHeight10,
              ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
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
    ),
              cHeight27,
              Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)
              ),
                width: 190,
                height: 50,
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

