import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_management/helper/colors.dart';

class HomeTopWidget extends StatelessWidget {
  final String? name;
  HomeTopWidget({
    super.key,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 370,
            height: 260,
            decoration: BoxDecoration(
                color: cPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Positioned(
            left: 85,
            top: 50,
            child: SizedBox(
              width: 300,
              height: 170,
              child: Image.asset(
                "assets/home_page/home_page.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi.....",
                    style: TextStyle(
                        color: cWhiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20)),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(name ?? "",
                      style: const TextStyle(
                          color: cWhiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
