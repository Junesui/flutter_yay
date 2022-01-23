import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';

/// 图标按钮
class MyIconBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  const MyIconBtn({Key? key, required this.onPressed, required this.icon, this.size = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.grey,
          size: SU.setFontSize(size),
        ));
  }
}
