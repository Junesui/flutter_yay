import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:flutter/material.dart';
import 'package:imitate_yay/widget/my_text.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MyText(
        text: Emojis.redHeart,
        fontSize: 60,
      ),
    );
  }
}
