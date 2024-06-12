 import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/helper/colors.dart';

Widget paymentShimmerEffect(double screenHeight, double screenWidth) {
    return Column(
      children: [
        cHeight10,
        SizedBox(
          height: screenHeight * .30,
          width: screenWidth,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
            ),
          ),
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
                  color: cWhiteColor,
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
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Card(
                    color: cPrimaryColor,
                    elevation: 0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: cWhiteARGBColor4,
                        radius: 50,
                      ),
                      title: Container(
                        height: 10,
                        color: Colors.white,
                      ),
                      subtitle: Container(
                        height: 10,
                        color: Colors.white,
                      ),
                      trailing: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: cGreenColor,
                        ),
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
              itemCount: 5,
            ),
          ),
        ),
      ],
    );
  }