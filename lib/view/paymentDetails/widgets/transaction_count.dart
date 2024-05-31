import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';

class PaymentCounts extends StatelessWidget {
  const PaymentCounts({super.key});

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
                  color: cShadowColor,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              color: cPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: cBlackColor,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    '₹ 5000',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                      color: cGreenColor,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
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
                          SizedBox(width: 7),
                          Text(
                            'Paid',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: cBlackColor,
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
                          SizedBox(width: 7),
                          Text(
                            'Balance',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: cBlackColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ 3000',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19,
                          color: cGreenARGBColor,
                        ),
                      ),
                      Text(
                        '₹ 2000',
                        style: TextStyle(
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
