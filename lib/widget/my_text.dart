import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';

/// 自定义text
class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration decoration;
  final TextOverflow overflow;
  final int maxLines;
  final TextAlign textAlign;

  const MyText(
      {Key? key,
      required this.text,
      this.fontSize = 24,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.white,
      this.decoration = TextDecoration.none,
      this.overflow = TextOverflow.ellipsis,
      this.maxLines = 999999999,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: SU.setFontSize(fontSize),
        fontWeight: fontWeight,
        decoration: decoration,
        overflow: overflow,
        height: 1,
      ),
    );
  }
}
