import 'package:flutter/material.dart';
import 'package:imitate_yay/page/tab/tabs.dart';
import 'package:imitate_yay/page/welcome/welcome_page.dart';

//配置路由
final Map<String, Function> routes = {
  "/": (context) => Tabs(),
  "/welcome": (context) => WelcomePage(),

  // '/registerSecond': (context,{arguments}) => RegisterSecondPage(arguments:arguments),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
