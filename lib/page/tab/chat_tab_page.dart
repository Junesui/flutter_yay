import 'package:flutter/material.dart';
import 'package:imitate_yay/widget/my_loading_container.dart';
import 'package:imitate_yay/widget/my_text.dart';

class ChatTabPage extends StatefulWidget {
  const ChatTabPage({Key? key}) : super(key: key);

  @override
  _ChatTabPageState createState() => _ChatTabPageState();
}

class _ChatTabPageState extends State<ChatTabPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyLoadingContainer(
      isLoading: _isLoading,
      child: Center(
        child: MyText(
          text: "text",
          fontSize: 100,
        ),
      ),
    );
  }
}
