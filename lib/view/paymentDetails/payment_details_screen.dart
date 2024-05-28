import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';
import 'package:student_management/view/paymentDetails/widgets/alertbox.dart';
import 'package:student_management/view/paymentDetails/widgets/transaction_count.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          radius: 10,
          backgroundColor: cPrimaryColor,
          child: Text(
            "12",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: cWhiteColor,
            ),
          ),
        ),
        title: const Text("Mufees Rahman"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: screenHeight * .30,
              width: screenWidth,
              child: const PaymentCounts(),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Recent Payments',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: cBlackARGBColor2,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: cWhiteColor24,
                height: 300,
                child: ListView.separated(
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: cPrimaryColor,
                      elevation: 0,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: cWhiteARGBColor4,
                          radius: 50,
                          child: Image.asset(
                            'assets/type/Cash.png',
                            height: 32,
                          ),
                        ),
                        title: const Text(
                          "₹ 1500",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: cWhiteColor,
                          ),
                        ),
                        subtitle: const Text(
                          '17/05/2024',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: cWhiteColor,
                          ),
                        ),
                        trailing: Container(
                          height: 30,
                          width: 30,
                          margin: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: cGreenColor,
                          ),
                          child: const Icon(
                            Icons.done,
                            color: cWhiteColor,
                            size: 20,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return const Divider(
                      height: 4,
                      thickness: 2,
                    );
                  },
                  itemCount: 3,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: cPrimaryColor,
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const AddTransaction(),
            // ));
            showDialog(
              context: context,
              builder: (context) {
                return const AlertBoxWidget();
              },
            );
          },
          child: const Icon(
            CupertinoIcons.add,
            color: cWhiteColor,
          )),
    );
  }
}
