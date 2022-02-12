import 'package:flutter/material.dart';
import 'package:imitate_yay/widget/my_appbar.dart';

/// 通话设置页面
class CallingSettingsPage extends StatefulWidget {
  const CallingSettingsPage({Key? key}) : super(key: key);

  @override
  _CallingSettingsPageState createState() => _CallingSettingsPageState();
}

class _CallingSettingsPageState extends State<CallingSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(myTitle: "通話設定"),
      body: _buildBody(),
    );
  }

  /// Body
  _buildBody() {}
}
