import 'package:flutter/material.dart';

extension WidgetsExtensions on Widget {
  Widget center() => Center(child: this);
  Widget symPadding({double? horizontal, double? vertical}) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: horizontal ?? 0,
      vertical: vertical ?? 0,
    ),
    child: this,
  );
  Widget sizedBox({double? width, double? height}) =>
      SizedBox(height: height, width: width, child: this);
}

extension ListPadding on List<Widget> {
  itemPadding({
    double? topPadding,
    double? rightPadding,
    double? leftPadding,
    double? bottomPadding,
    double? lastItemBottomPadding,
    bool? isLasItem = false,
  }) {
    return map(
      (element) => Padding(
        padding: EdgeInsets.only(
          top: topPadding ?? 0,
          right: rightPadding ?? 0,
          left: leftPadding ?? 0,
          bottom: isLasItem! ? lastItemBottomPadding ?? 0 : bottomPadding ?? 0,
        ),
        child: element,
      ),
    ).toList();
  }
}
