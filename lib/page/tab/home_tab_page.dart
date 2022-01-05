import 'package:flutter/material.dart';
import 'package:imitate_yay/page/home/home_page.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key? key}) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
