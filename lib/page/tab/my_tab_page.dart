import 'package:flutter/material.dart';

class MyTabPage extends StatefulWidget {
  const MyTabPage({Key? key}) : super(key: key);

  @override
  _MyTabPageState createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "MyTabPage",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
