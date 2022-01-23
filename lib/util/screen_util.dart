import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SU {
  // 设置宽度
  static setWidth(num width) {
    return ScreenUtil().setWidth(width);
  }

  // 设置高度
  static setHeight(num height) {
    return ScreenUtil().setHeight(height);
  }

  // 设置文字大小
  static double setFontSize(num fontSize) {
    return ScreenUtil().setSp(fontSize);
  }

  // 获取屏幕宽度
  static double getScreenWidth() {
    return ScreenUtil().screenWidth;
  }

  // 获取屏幕高度
  static double getScreenHeight() {
    return ScreenUtil().screenHeight;
  }

  // 获取状态栏高度
  static double getStateBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
