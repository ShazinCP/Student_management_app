import 'package:flutter/material.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/helper/colors.dart';

// ignore: must_be_immutable
class PaymentCounts extends StatelessWidget {
  final String? balanceAmount;
  final String? paidAmount;
  final String? totalAmount;
  const PaymentCounts(
      {super.key,
      required this.balanceAmount,
      required this.paidAmount,
      required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    // final double screenHeight = size.height;
    return Stack(
      children: [
        Center(
          child: Container(
            height: 180,
            width: 350,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
              color: cPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: cSecondaryColor,
                    ),
                  ),
                ),
                cHeight5,
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    '₹$totalAmount',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: cSecondaryColor,
                    ),
                  ),
                ),
                cHeight25,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: cGreenColor,
                            child: Icon(
                              Icons.arrow_upward,
                              color: cWhiteColor,
                              size: 19,
                            ),
                          ),
                          cWidth7,
                          Text(
                            'Paid',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: cSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 13,
                            backgroundColor: cRedColor,
                            child: Icon(
                              Icons.arrow_downward,
                              color: cWhiteColor,
                              size: 19,
                            ),
                          ),
                          cWidth7,
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: cSecondaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                cHeight6,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹$paidAmount',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: cGreenARGBColor,
                        ),
                      ),
                      Text(
                        '₹$balanceAmount',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: cRedColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
