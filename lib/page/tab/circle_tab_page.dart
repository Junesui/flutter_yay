import 'package:flutter/material.dart';
import 'package:imitate_yay/page/circle/circle_page.dart';

class CircleTabPage extends StatefulWidget {
  const CircleTabPage({Key? key}) : super(key: key);

  @override
  _CircleTabPageState createState() => _CircleTabPageState();
}

class _CircleTabPageState extends State<CircleTabPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CirclePage();
  }
}
