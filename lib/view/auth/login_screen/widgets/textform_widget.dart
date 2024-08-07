import 'package:flutter/material.dart';
import 'package:student_management/helper/colors.dart';

class LoginField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  const LoginField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(110)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 3,
          //     offset: const Offset(0, 5), // changes position of shadow
          //   ),
          // ],
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              focusColor: Colors.black,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ), // Set the border radius here
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ), // Set the border radius here to be the same as enabledBorder
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: cBlackColor,fontSize: 15),
              filled: true, // Enable the fill color
              fillColor: cWhiteColor,  // Set the fill color to white
              ),
        ));
  }
}
