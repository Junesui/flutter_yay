import 'package:flutter/material.dart';

class CircleTabPage extends StatefulWidget {
  const CircleTabPage({Key? key}) : super(key: key);

  @override
  _CircleTabPageState createState() => _CircleTabPageState();
}

class _CircleTabPageState extends State<CircleTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "CircleTabPage",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
