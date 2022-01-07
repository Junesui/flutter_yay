import 'package:flutter/material.dart';

class CircleTabPage extends StatefulWidget {
  const CircleTabPage({Key? key}) : super(key: key);

  @override
  _CircleTabPageState createState() => _CircleTabPageState();
}

class _CircleTabPageState extends State<CircleTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: 50,
        width: 50,
        color: Colors.white,
        child: PopupMenuButton(
            icon: Icon(Icons.home),
            //child: Text("aaaaaaaaaaaa"),
            itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("11111")),
                PopupMenuItem(child: Text("22222")),
                PopupMenuItem(child: Text("33333")),
              ];
            }),
      ),
    ));
  }
}
