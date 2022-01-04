import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // 背景图片URL
  String backImgUrl =
      "https://images.pexels.com/photos/2647973/pexels-photo-2647973.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // 背景图片
            Positioned.fill(
              child: Image.network(
                backImgUrl,
                fit: BoxFit.fill,
              ),
            ),
            // 底部注册或登录框
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenUtil.getScreenWidth(),
                height: ScreenUtil.getScreenHeight() / 3.5,
                color: const Color(0xcc788c82),
                child: Stack(
                  children: [
                    _buildRegisterBtn(),
                    _buildLoginHint(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 注册按钮
  _buildRegisterBtn() {
    return Center(
      child: InkWell(
        onTap: () {
          print("click register button");
        },
        child: Container(
          width: ScreenUtil.getScreenWidth() / 3,
          height: ScreenUtil.setHeight(120),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              ScreenUtil.setHeight(60),
            ),
            border: Border.all(
              width: 0.2,
              color: Colors.black54,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 1,
              ),
            ],
          ),
          //padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Text(
            "注册",
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil.setFontSize(50),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // 已有账号，登录提示
  _buildLoginHint() {
    return Align(
      alignment: const Alignment(0, 0.45),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "已经有账号了？",
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil.setFontSize(36),
              ),
            ),
            InkWell(
              onTap: () {
                print("click login font");
              },
              child: Text(
                "登录",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.setFontSize(36),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
