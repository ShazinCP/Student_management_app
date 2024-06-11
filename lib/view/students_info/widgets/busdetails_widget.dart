import 'package:flutter/material.dart';
import 'package:student_management/constants/sizedboxes.dart';
import 'package:student_management/helper/colors.dart';

class BusDetailsWidget extends StatelessWidget {
  final String contant;
  final String count;
  const BusDetailsWidget({
    super.key,
    required this.contant,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$contant :",
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        cWidth15,
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: cWhiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: cBlackColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 2)),
              ]),
          child: Center(
            child: Text(
              count,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
          ),
        )
      ],
    );
  }
}
