import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_management/helper/colors.dart';

class HomeTopWidget extends StatelessWidget {
  final String? name;
  const HomeTopWidget({
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
            decoration: const BoxDecoration(
                color: cPrimaryColor,
                borderRadius: BorderRadius.all(
                   Radius.circular(30),
                    )),
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
            left: 12,
            top: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Hello",
                    style: TextStyle(
                        color: cWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("$name,",
                      style: const TextStyle(
                          color: cWhiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
              ],
            ),
          ),
          const Positioned(
            left: 12,
            top: 45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome ",
                    style: TextStyle(
                        color: cWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Text("back!",
                      style: TextStyle(
                          color: cWhiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
