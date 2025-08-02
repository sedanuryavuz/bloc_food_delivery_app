import 'package:flutter/material.dart';

class SWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height * 0.70);

    path.cubicTo(
        size.width * 0.05, size.height * 1.2,
        size.width * 0.95, size.height * -0.1,
        size.width, size.height * 0.70
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
