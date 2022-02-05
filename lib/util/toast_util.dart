import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  /// 弹出消息
  static Future show({
    required String msg,
    Color bColor = Colors.white,
    Color textColor = Colors.black,
    double fontSize = 30,
    ToastGravity position = ToastGravity.CENTER,
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: bColor,
      textColor: textColor,
      fontSize: fontSize,
      toastLength: Toast.LENGTH_SHORT,
      gravity: position,
      timeInSecForIosWeb: 1,
    );
  }
}
