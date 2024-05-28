
import 'package:flutter/material.dart';

class HomeCenterWidget extends StatelessWidget {
 final String? image;
 final String? text;
 final VoidCallback? onTap;
   HomeCenterWidget({
    super.key, this.image, this.text, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap, 
      child: Container(
        width: 150,
        height: 100,
     
        decoration: BoxDecoration(
             color: Colors.blue,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30))),
        child: Column(
          children: [
            Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 140,
        height: 60,
        decoration: BoxDecoration(
           image: DecorationImage(
                    image: AssetImage(image!),
                    fit: BoxFit.cover,
                  ),
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30)),),
      ),
            ),
            
            Text(text!,style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15),)
            
          ],
        ),
      ),
    );
  }
}