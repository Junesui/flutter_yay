import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

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
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Container(
            height: index * 30,
            color: Colors.primaries[index % 18],
          ),
        );
      },
      itemCount: 10,
      viewportFraction: 0.8,
      scale: 0.8,
    );
  }
}
