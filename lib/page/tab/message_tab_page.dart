import 'package:flutter/material.dart';
import 'package:imitate_yay/util/toast_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

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

  Widget _buildTest() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            ToastUtil.show(msg: "msg");
          },
          child: MyText(text: "text")),
    );
  }
}
