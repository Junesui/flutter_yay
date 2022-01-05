import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitate_yay/router/router.dart';
import 'package:imitate_yay/util/color_util.dart';

void main() {
  runApp(const MyApp());

  // 设置状态栏背景为透明
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorUtil.primaryBackGroundColor,

          // 取消一些组件的默认点击效果
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }
}
