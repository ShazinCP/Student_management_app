import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/paymentDetails/payment_details_screen.dart';
import 'package:student_management/view/studentList/widgets/searchfield.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            // spreadRadius: 2,
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
                      'STUDENT LIST',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
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
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Card(
                      color: cPrimaryColor,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PaymentDetailsScreen(),
                        )),
                        child: const ListTile(
                          leading: CircleAvatar(
                            backgroundColor: cSecondaryColor,
                            child: Text(
                              '12',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            "Mufees Rahman",
                            style: TextStyle(
                              color: cWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    );
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
