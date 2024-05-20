import 'package:flutter/material.dart';

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
              width: 350,
              height: 200,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50) )
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 80, top: 40),
            child: SizedBox(
              width: 280,
              height: 150,
              child: Image.asset(
                "assets/home_page.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(35.0),
            child: Text(name??"",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text("Hi",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
        ],
      ),
    );
  }
}