import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';

class HomeCenterWidget extends StatelessWidget {
  final String? image;
  final String? text;
  final VoidCallback? onTap;
  const HomeCenterWidget({
    super.key,
    this.image,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 120,
        decoration: BoxDecoration(
          color: cPrimaryColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset in x and y directions
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Container(
                width: 160,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
              ),
              Text(
                text!,
                style: const TextStyle(
                    color: cWhiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
