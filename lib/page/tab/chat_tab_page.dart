import 'package:flutter/material.dart';
import 'package:imitate_yay/net/http/http_utils.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';

class ChatTabPage extends StatefulWidget {
  const ChatTabPage({Key? key}) : super(key: key);

  @override
  _ChatTabPageState createState() => _ChatTabPageState();
}

class _ChatTabPageState extends State<ChatTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyIconBtn(
        onPressed: () {
          _dioTest();
        },
        icon: Icons.add,
        size: 200,
      ),
    );
  }

  _dioTest() async {
    HttpUtils.init(baseUrl: "https://api.yay.space/");
    await HttpUtils.get("v1/games/aapps");
  }
}
