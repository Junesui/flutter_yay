import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// AppBar
class MyAppBar extends AppBar {
  // 标题
  final String myTitle;
  // 标题大小
  final double fontSize;
  // 右侧 Icon
  final IconData? actionIcon;
  // 右侧 Icon 大小
  final double? actionIconSize;
  // 右侧 Icon 点击事件
  final VoidCallback? actionIconOnTap;

  MyAppBar({
    Key? key,
    required this.myTitle,
    this.fontSize = 150,
    this.actionIcon,
    this.actionIconSize,
    this.actionIconOnTap,
  }) : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: MyIconBtn(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icons.arrow_back_ios,
      ),
      title: MyText(
        text: widget.myTitle,
        fontSize: SU.setFontSize(widget.fontSize),
      ),
      centerTitle: true,
      actions: widget.actionIcon == null
          ? null
          : [
              Padding(
                padding: EdgeInsets.only(right: SU.setWidth(CommonConstant.mainLRPadding)),
                child: MyIconBtn(
                  onPressed: widget.actionIconOnTap ?? () {},
                  icon: widget.actionIcon ?? Icons.title,
                  size: SU.setFontSize(widget.actionIconSize ?? 180),
                ),
              ),
            ],
      backgroundColor: CommonConstant.primaryBackGroundColor,
      elevation: 0,
    );
  }
}
