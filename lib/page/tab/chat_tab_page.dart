import 'package:flutter/material.dart';
import 'package:imitate_yay/widget/my_text.dart';

class ChatTabPage extends StatefulWidget {
  const ChatTabPage({Key? key}) : super(key: key);

  @override
  _ChatTabPageState createState() => _ChatTabPageState();
}

class _ChatTabPageState extends State<ChatTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyText(
        text: "Chat Page",
        fontSize: 50,
      ),
    );
  }
}
