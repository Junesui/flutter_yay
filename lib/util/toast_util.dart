import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';

class ToastUtil {
  /// 弹出消息
  static Future show({
    required String msg,
    Color bColor = CommonConstant.primaryColor,
    Color textColor = Colors.black,
    double fontSize = 36,
    ToastGravity position = ToastGravity.CENTER,
    Toast toastLength = Toast.LENGTH_SHORT,
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: bColor,
      textColor: textColor,
      fontSize: SU.setFontSize(fontSize),
      toastLength: toastLength,
      gravity: position,
      timeInSecForIosWeb: 1,
    );
  }
}
