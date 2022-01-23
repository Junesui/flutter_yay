import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/router/router.dart';
import 'package:imitate_yay/util/screen_util.dart' as myScreenUtil;
import 'package:imitate_yay/widget/my_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    // 屏幕适配
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
      builder: () => _buildPullToRefresh(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: CommonConstant.primaryBackGroundColor,
            // 取消一些组件的默认点击效果
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
        ),
      ),
    );
  }

  // 上拉刷新-下拉加载 的全局配置
  _buildPullToRefresh(Widget child) {
    return RefreshConfiguration(
      headerBuilder: () => WaterDropHeader(
        complete: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white60,
              size: myScreenUtil.SU.setFontSize(45),
            ),
            const SizedBox(width: 5),
            const MyText(
              text: "刷新成功",
              color: Colors.white60,
              fontSize: 40,
            ),
          ],
        ),
        failed: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white60,
              size: myScreenUtil.SU.setFontSize(45),
            ),
            const SizedBox(width: 5),
            const MyText(
              text: "刷新失败",
              color: Colors.white60,
              fontSize: 40,
            ),
          ],
        ),
      ),
      footerBuilder: () => CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const MyText(text: "");
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const MyText(text: "加载失败！点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = const MyText(text: "");
          } else {
            body = const MyText(text: "没有更多数据了!");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      headerTriggerDistance: 80.0,
      maxOverScrollExtent: 120,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: true,
      enableBallisticLoad: true,
      child: child,
    );
  }
}
