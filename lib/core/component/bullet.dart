import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Bullet extends Text {
  const Bullet(
    String data, {
    Key? key,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    TextScaler? textScaler,
    int? maxLines,
    String? semanticsLabel,
  }) : super(
         '• $data',
         key: key,
         style: style,
         textAlign: textAlign,
         textDirection: textDirection,
         locale: locale,
         softWrap: softWrap,
         overflow: overflow,
         textScaler: textScaler,
         maxLines: maxLines,
         semanticsLabel: semanticsLabel,
       );
}

class HtmlBullet extends Html {
  // ignore: use_super_parameters
  HtmlBullet(String data, {super.key})
    : super(
        // data: data,
        // key: key,
        data: '• $data',
      );
}
