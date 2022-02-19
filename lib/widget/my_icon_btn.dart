import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';

/// 图标按钮
class MyIconBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final Color color;
  const MyIconBtn(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.size = 60,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        color: color,
        size: SU.setFontSize(size),
      ),
    );
  }
}
