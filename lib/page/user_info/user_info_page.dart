import 'package:flutter/material.dart';

/// 用户信息页。【点击用户头像后，跳转】
class UserInfoPage extends StatefulWidget {
  final Map arguments;
  // arguments 说明:
  // 用户ID - int id;

  const UserInfoPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Placeholder(),
    );
  }
}
