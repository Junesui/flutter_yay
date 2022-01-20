import 'package:flutter/material.dart';

class ProfileTabView extends StatefulWidget {
  // TabBar的索引
  final int index;

  const ProfileTabView({Key? key, required this.index}) : super(key: key);

  @override
  _ProfileTabViewState createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text(
          widget.index.toString(),
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
