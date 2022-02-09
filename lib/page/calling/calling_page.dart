import 'package:flutter/material.dart';

/// 通话页面
class CallingPage extends StatefulWidget {
  const CallingPage({Key? key}) : super(key: key);

  @override
  _CallingPageState createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  /// AppBar
  _buildAppBar() {}
}
