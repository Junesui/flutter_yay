import 'package:flutter/material.dart';
import 'package:imitate_yay/widget/my_text.dart';

class CircleTabView extends StatefulWidget {
  // 分类ID
  final int cid;

  const CircleTabView({Key? key, required this.cid}) : super(key: key);

  @override
  _CircleTabViewState createState() => _CircleTabViewState();
}

class _CircleTabViewState extends State<CircleTabView> {
  @override
  Widget build(BuildContext context) {
    return MyText(text: "${widget.cid}");
  }
}
