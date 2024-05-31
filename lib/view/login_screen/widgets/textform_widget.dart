import 'package:flutter/material.dart';

class loginfield extends StatelessWidget {
  final String text;
  const loginfield({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(110)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
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
              hintText: text,
              hintStyle: TextStyle(color: Colors.white),
              filled: true, // Enable the fill color
              fillColor: Color.fromARGB(
                  255, 135, 149, 177) // Set the fill color to white
              ),
        ));
  }
}
