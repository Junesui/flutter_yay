import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as TSU;

class ScreenUtil {
  // 设置宽度
  static setWidth(num width) {
    return TSU.ScreenUtil().setWidth(width);
  }

  // 设置高度
  static setHeight(num height) {
    return TSU.ScreenUtil().setHeight(height);
  }

  // 设置文字大小
  static double setFontSize(num fontSize) {
    return TSU.ScreenUtil().setSp(fontSize);
  }

  // 获取屏幕宽度
  static double getScreenWidth() {
    return TSU.ScreenUtil().screenWidth;
  }

  // 获取屏幕高度
  static double getScreenHeight() {
    return TSU.ScreenUtil().screenHeight;
  }

  // 获取状态栏高度
  static double getStateBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
