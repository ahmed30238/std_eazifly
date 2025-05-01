import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlacesWidget extends StatelessWidget {
  final double width;
  final double height;
  final String board;
  final String medal;
  final String avatar;
  const PlacesWidget({
    super.key,
    required this.width,
    required this.height,
    required this.avatar,
    required this.medal,
    required this.board,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              board,
            ),
            Image.asset(
              avatar,
              height: height,
              width: width,
            ),
          ],
        ),
        SvgPicture.asset(medal),
      ],
    );
  }
}