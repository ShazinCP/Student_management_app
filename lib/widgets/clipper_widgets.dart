// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class DrawClip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.80); // Move to the bottom left corner
//     path.quadraticBezierTo(
//       size.width / 10, // Control point's x
//       size.height * 0.400, // Control point's y
//       size.width * 0.30, // End point's x
//       size.height * 0.20, // End point's y
//     );
//     path.lineTo(size.width * 0.70,
//         size.height * 0.20); // Horizontal line to the right, before the curve
//     path.quadraticBezierTo(
//       size.width * 0.85, // Control point's x
//       size.height * 0.50, // Control point's y
//       size.width, // End point's x
//       size.height * 0.80, // End point's y
//     );
//     path.lineTo(size.width, size.height); // Move to the bottom right corner
//     path.lineTo(size.width, 0); // Move to the top right corner
//     path.close(); // Close the path
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
