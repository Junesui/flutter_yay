import 'package:flutter/material.dart';

class HomeTabView extends StatefulWidget {
  final int type;

  const HomeTabView({Key? key, required this.type}) : super(key: key);

  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return Text(
          "type is ${widget.type}. index is ${index}",
          style: TextStyle(color: Colors.white),
        );
      },
    );
  }
}
