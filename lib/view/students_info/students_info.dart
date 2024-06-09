import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        backgroundColor: cBackgroundColor,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: cPrimaryColor,
                child: Text(
                  gender,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
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
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          }

          if (provider.studentInfo == null) {
            return const Center(child: Text("No data available"));
          }

          final student = provider.studentInfo!;

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 280,
                  width: 350,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
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
                      BusDetailsWidget(
                        contant: "Bus No",
                        count: student.bus.busNo.toString(),
                      ),
                      BusDetailsWidget(
                        contant: "Route No",
                        count: student.route.routeNo.toString(),
                      ),
                      Column(
                        children: [
                          Text(
                            "Bus point ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 90),
                            child: Divider(
                              thickness: 2,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: cWhiteColor,
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
                            child: Center(
                              child: Text(
                                student.bus.driverName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: cBlackColor.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Bus Points",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: cWhiteColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: cWhiteColor,
                            thickness: 5,
                          ),
                        ),
                        // Expanded(
                        //   child: ListView.builder(
                        //     itemCount: student.busPoints.length,
                        //     itemBuilder: (context, index) {
                        //       final buspointList = student.busPoints[index];
                        //       return Padding(
                        //         padding: const EdgeInsets.symmetric(vertical: 5),
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //             color: cWhiteColor,
                        //             borderRadius: BorderRadius.circular(10),
                        //             boxShadow: [
                        //               BoxShadow(
                        //                 color: cBlackColor.withOpacity(0.5),
                        //                 spreadRadius: 2,
                        //                 blurRadius: 2,
                        //                 offset: const Offset(0, 2),
                        //               ),
                        //             ],
                        //           ),
                        //           child: ListTile(
                        //             title: Text(
                        //               buspointList.name,
                        //               style: const TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 18,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: cPrimaryColor),
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentDetailsScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: cBackgroundColor,
                          elevation: 5,
                          shadowColor: Colors.black.withOpacity(0.5),
                        ),
                        child: Text(
                          'payment Details',
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
