import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

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
                width: SU.getScreenWidth(),
                height: SU.getScreenHeight() / 3.5,
                decoration: const BoxDecoration(
                  color: Color(0xcc788c82),
                  border: Border(
                    top: BorderSide(
                      width: 2,
                      color: Color(0xcc788c82),
                    ),
                  ),
                ),
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
      child: SizedBox(
        width: SU.setWidth(450),
        height: SU.setHeight(108),
        child: ElevatedButton(
          onPressed: () {
            print("click register button");
          },
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.teal,
              elevation: 0,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SU.setHeight(50)),
              )),
          child: const MyText(
            text: "注 册",
            color: Colors.black,
            fontSize: 48,
            fontWeight: FontWeight.w500,
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
            MyText(
              text: "已经有账号了？",
              fontSize: 36,
            ),
            InkWell(
              onTap: () {
                print("click login font");
              },
              child: const MyText(
                text: "登录",
                fontSize: 36,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
