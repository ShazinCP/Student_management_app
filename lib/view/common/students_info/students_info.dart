import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/controller/studentinfo_provider.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/common/paymentDetails/payment_details_screen.dart';
import 'package:student_management/view/common/students_info/widgets/busdetails_widget.dart';
import 'package:student_management/widgets/uppercase.dart';

class StudentsInfoScreen extends StatelessWidget {
  final int id;
  final String name;
  final String admissionNo;

  const StudentsInfoScreen({
    super.key,
    required this.id,
    required this.name,
    required this.admissionNo,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentInfoProvider>(context, listen: false);
    provider.fetchStudentInfo(id);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: cBackgroundColor,
      appBar: AppBar(
        backgroundColor: cPrimaryColor,
        // automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: cWhiteColor),
        title: Column(
          children: [
            Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(5),
                //   child: CircleAvatar(
                //     radius: 18,
                //     backgroundColor: cSecondaryColor,
                //     child: Text(
                //       admissionNo,
                //       style: TextStyle(
                //         fontSize: 8.5,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.grey[700],
                //       ),
                //     ),
                //   ),
                // ),
                // cHeight10,
                Text(
                  ' ${name.capitalize()}',
                  style: const TextStyle(color: cWhiteColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 7),
              child: Row(
                children: [
                  Text(
                    admissionNo,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color.fromARGB(255, 230, 230, 230),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Consumer<StudentInfoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return _buildShimmerEffect(screenWidth, screenHeight);
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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: RefreshIndicator(
                onRefresh: () => provider.fetchStudentInfo(id),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    Container(
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                        color: cPrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: cBlackColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
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
                                count: student.bus?.busNo?.toString() ?? "0",
                              ),
                              BusDetailsWidget(
                                contant: "Route No",
                                count:
                                    student.route?.routeNo?.toString() ?? "0",
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
                                (student.busPoint?.name ?? 'Unknown')
                                    .capitalize(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    const Text(
                      "Bus Routes",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: cBlackColor,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: const Divider(
                        color: cBlackColor,
                        thickness: 2,
                      ),
                    ),
                    SizedBox(
                        height: screenHeight * 0.45,
                        width: double.infinity,
                        child: provider.busPoints.isEmpty
                            ? const Center(
                                child: Text(
                                  'No bus points found',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: cBlackColor,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount: provider.busPoints.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
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
                                            provider.busPoints[index]
                                                .capitalize(),
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
                    // SizedBox(height: screenHeight * 0.01),
                    Center(
                      child: SizedBox(
                        width: screenWidth * 0.5,
                        height: screenHeight * 0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentDetailsScreen(
                                  studentId: student.student?.id ?? 0,
                                  admissionNo: admissionNo,
                                  name: name,
                                ),
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
                            style: TextStyle(fontSize: 16, color: cWhiteColor),
                          ),
                        ),
                      ),
                    ),
                    cHeight20,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerEffect(double screenWidth, double screenHeight) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              Container(
                height: screenHeight * 0.25,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              Container(
                height: screenHeight * 0.04,
                width: screenWidth * 0.4,
                color: Colors.grey.withOpacity(0.5),
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(color: Colors.grey.withOpacity(0.5), thickness: 2),
              SizedBox(height: screenHeight * 0.01),
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
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: screenWidth * 0.5,
                height: screenHeight * 0.07,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
