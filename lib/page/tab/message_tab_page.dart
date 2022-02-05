import 'package:flutter/material.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:share_plus/share_plus.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> {
  @override
  Widget build(BuildContext context) {
    return _buildTest();
  }

  /// Test
  Widget _buildTest() {
    return MyIconBtn(
      onPressed: () {
        Share.share('check out my website https://example.com');
      },
      icon: Icons.home,
    );
  }
}
