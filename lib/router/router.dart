import 'package:flutter/cupertino.dart';
import 'package:imitate_yay/page/common/photo_view_page.dart';
import 'package:imitate_yay/page/search/qr/qr_page.dart';
import 'package:imitate_yay/page/search/search_page.dart';
import 'package:imitate_yay/page/tab/tabs.dart';
import 'package:imitate_yay/page/welcome/welcome_page.dart';
import 'package:imitate_yay/router/router_name.dart';

//配置路由
final Map<String, Function> routes = {
  RouterName.photoView: (context, {arguments}) => PhotoViewPage(arguments: arguments),
  RouterName.root: (context) => Tabs(),
  RouterName.welcome: (context) => WelcomePage(),
  RouterName.search: (context) => SearchPage(),
  RouterName.qr: (context) => SearchQRPage(),
};

//固定写法 [CupertinoPageRoute: ios风格的路由]
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
