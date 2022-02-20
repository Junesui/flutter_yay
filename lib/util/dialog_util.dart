import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';

/// 弹出框
class DialogUtil {
  static Future show(
    BuildContext context, {
    required String text,
    required VoidCallback btnOkOnPress,
  }) {
    return AwesomeDialog(
      context: context,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(
          text,
          style: TextStyle(
            fontSize: SU.setFontSize(42),
            color: Colors.black,
          ),
        ),
      ),
      btnOkText: "确定",
      btnCancelText: "取消",
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: () {},
      btnOkColor: CommonConstant.primaryColor,
      btnCancelColor: Colors.brown,
      dialogType: DialogType.NO_HEADER,
      animType: AnimType.BOTTOMSLIDE,
    ).show();
  }
}
