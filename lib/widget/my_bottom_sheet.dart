import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// showModalBottomSheet 的 内容
class MyBottomSheet extends StatelessWidget {
  final List<BottomSheetParam> params;

  const MyBottomSheet({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenUtil.setWidth(32),
        bottom: ScreenUtil.setHeight(50),
      ),
      decoration: const BoxDecoration(
        color: CommonConstant.primaryBackGroundColor,
      ),
      child: Wrap(
        children: [
          Column(
            children: params.map<Widget>((param) {
              return _buildMoreBottomSheetItem(param.onTap, param.icon, param.text);
            }).toList(),
          ),
        ],
      ),
    );
  }

  _buildMoreBottomSheetItem(Function() onTap, IconData icon, String text) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: ScreenUtil.setHeight(60)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
              size: ScreenUtil.setFontSize(60),
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 15),
                child: SizedBox(
                  width: ScreenUtil.setWidth(50),
                )),
            MyText(
              text: text,
              fontSize: 45,
            )
          ],
        ),
      ),
    );
  }
}

/// 底部弹窗的子项参数
class BottomSheetParam {
  Function() onTap;
  IconData icon;
  String text;

  BottomSheetParam({required this.onTap, required this.icon, required this.text});
}
