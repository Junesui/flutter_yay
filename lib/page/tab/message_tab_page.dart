import 'package:flutter/material.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "MessageTabPage",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
