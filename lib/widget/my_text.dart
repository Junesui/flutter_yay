import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration decoration;

  const MyText(
      {Key? key,
      required this.text,
      this.fontSize = 24,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.white,
      this.decoration = TextDecoration.none})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: ScreenUtil.setFontSize(fontSize),
        fontWeight: fontWeight,
        decoration: decoration,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
