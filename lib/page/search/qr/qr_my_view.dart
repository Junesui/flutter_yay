import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 我的二维码TabBarView
class QRMyView extends StatelessWidget {
  const QRMyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String testAvatarUrl =
        "https://images.pexels.com/photos/4386364/pexels-photo-4386364.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              // 二维码
              Container(
                width: SU.getScreenWidth() * 0.65,
                height: SU.getScreenWidth() * 0.65 * 1.2,
                margin: EdgeInsets.only(top: SU.setHeight(90)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SU.setHeight(50)),
                ),
                child: Center(
                  child: QrImage(
                    data: "1234567890",
                    version: 8,
                    size: SU.getScreenWidth() * 0.5,
                    // padding: EdgeInsets.all(5),
                  ),
                ),
              ),
              // 头像
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SU.setHeight(150)),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    )),
                child: CircleAvatar(
                  backgroundImage: MyCacheNetImg.provider(testAvatarUrl),
                  backgroundColor: Colors.transparent,
                  radius: SU.setHeight(90),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // 文字
          MyText(
            text: "扫一扫添加好友",
            color: Colors.grey,
            fontSize: SU.setFontSize(120),
          ),
          const SizedBox(height: 30),
          // 分享图标
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SU.setWidth(100)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareIcon(),
                _buildExternalAppIcon(FontAwesome.wechat, Colors.green),
                _buildExternalAppIcon(FontAwesome.qq, Colors.blue),
                _buildExternalAppIcon(FontAwesome.twitter, Colors.lightBlueAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 分享图标
  _buildShareIcon() {
    return Container(
      height: SU.setHeight(140),
      width: SU.setWidth(140),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(SU.setHeight(70))),
      child: Icon(
        Icons.share,
        color: CommonConstant.primaryColor,
        size: SU.setFontSize(50),
      ),
    );
  }

  /// 外部 app 图标
  _buildExternalAppIcon(IconData icon, Color backgroundColor) {
    return CircleAvatar(
      radius: SU.setHeight(70),
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: Colors.white,
        size: SU.setFontSize(50),
      ),
    );
  }
}
