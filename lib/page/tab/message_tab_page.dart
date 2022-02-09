import 'package:flutter/material.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: PhysicalModel(
          color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              "assets/images/avatar.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
