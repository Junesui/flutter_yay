import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';

/// 自定义text
class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;
  final TextOverflow overflow;
  final int maxLines;

  const MyText(
      {Key? key,
      required this.text,
      this.fontSize = 24,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.white,
      this.decoration = TextDecoration.none,
      this.overflow = TextOverflow.ellipsis,
      this.maxLines = 999999999})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: ScreenUtil.setFontSize(fontSize),
        fontWeight: fontWeight,
        decoration: decoration,
        overflow: overflow,
        height: 1,
      ),
    );
  }
}
