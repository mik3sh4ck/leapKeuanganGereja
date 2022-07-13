// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginRegisCustomClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.1442857);
    path.quadraticBezierTo(size.width * 0.1781250, size.height * 0.2050000,
        size.width * 0.3766667, size.height * 0.1628571);
    path.cubicTo(
        size.width * 0.5083333,
        size.height * 0.1264286,
        size.width * 0.5183333,
        size.height * 0.1078571,
        size.width * 0.7100000,
        size.height * 0.0757143);
    path.quadraticBezierTo(size.width * 0.9027083, size.height * 0.0625000,
        size.width, size.height * 0.1028571);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class LoginRegisCustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.1114286);
    path.quadraticBezierTo(size.width * 0.1772917, size.height * 0.1835714,
        size.width * 0.3758333, size.height * 0.1414286);
    path.cubicTo(
        size.width * 0.5075000,
        size.height * 0.1050000,
        size.width * 0.5250000,
        size.height * 0.1007143,
        size.width * 0.7083333,
        size.height * 0.0642857);
    path.quadraticBezierTo(size.width * 0.8735417, size.height * 0.0496429,
        size.width, size.height * 0.0800000);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
