import 'dart:math';

import 'package:flutter/material.dart';

class HexaGon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double width = size.width;
    final double height = size.height;

    path.lineTo(width * .25, 0);
    path.lineTo(width * .75, 0);
    path.lineTo(width, height * sqrt(3) / 4);
    path.lineTo(width * .75, height * sqrt(3) / 2);
    path.lineTo(width * .25, height * sqrt(3) / 2);
    path.lineTo(0, height * sqrt(3) / 4);
    path.lineTo(width * .25, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
