import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imitate_yay/widget/my_text.dart';

class CircleTabPage extends StatefulWidget {
  const CircleTabPage({Key? key}) : super(key: key);

  @override
  _CircleTabPageState createState() => _CircleTabPageState();
}

class _CircleTabPageState extends State<CircleTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyText(text: "CircleTabPage"),
      ),
    );
  }
}
