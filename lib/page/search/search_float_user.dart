import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/search/search_hima_users_model.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 搜索页点击顶部用户头像，弹出悬浮的用户信息弹窗
class SearchFloatUser extends StatefulWidget {
  final List<HimaUsers> himaUsers;
  final int index;

  const SearchFloatUser({Key? key, required this.himaUsers, required this.index}) : super(key: key);

  @override
  _SearchFloatUserState createState() => _SearchFloatUserState();
}

class _SearchFloatUserState extends State<SearchFloatUser> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return _buildUser(widget.himaUsers[index]);
      },
      index: widget.index,
      loop: false,
      viewportFraction: 0.8,
      scale: 0.8,
    );
  }

  /// 弹窗用户信息子项
  _buildUser(HimaUsers user) {
    return Column(
      children: [
        _buildBlankPlaceHolder(),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: CommonConstant.primaryBackGroundColor,
            child: Column(
              children: [
                // 背景图，头像，更多按钮
                SizedBox(
                  height: SU.setHeight(420),
                  child: Stack(
                    children: [
                      // 封面图
                      Container(
                        height: SU.setHeight(350),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                          image: DecorationImage(
                            image: MyCacheNetImg.provider(user.user?.coverImageThumbnail ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // 头像
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: SU.setHeight(100),
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              MyCacheNetImg.provider(user.user?.profileIconThumbnail ?? ""),
                        ),
                      ),
                      // 更多按钮
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: MyIconBtn(
                            onPressed: _buildMoreBottomSheet,
                            icon: Icons.more_horiz,
                            color: Colors.white70,
                            size: SU.setFontSize(200),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 昵称
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: MyText(
                    text: user.user?.nickname ?? "",
                    fontSize: 46,
                    textAlign: TextAlign.center,
                  ),
                ),
                // 简介
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: MyText(
                    text: user.user?.biography ?? "",
                    fontSize: 36,
                    color: Colors.grey,
                    textAlign: TextAlign.center,
                  ),
                ),
                // 聊天按钮
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: SizedBox(
                      width: SU.getScreenWidth() * 0.8 * 0.7,
                      child: const MyText(
                        text: "チャット",
                        fontSize: 42,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      primary: CommonConstant.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildBlankPlaceHolder(),
      ],
    );
  }

  /// 空白占位，点击后 pop
  _buildBlankPlaceHolder() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const SizedBox.expand(
          child: MyText(text: ""),
        ),
      ),
    );
  }

  /// 点击更多按钮，弹出底部弹窗
  _buildMoreBottomSheet() {
    List<BottomSheetParam> params = [];
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.share, text: "分享"));
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.sms, text: "聊天"));
    params.add(BottomSheetParam(
        onTap: () {
          Navigator.pop(context);
        },
        icon: Icons.cancel,
        text: "取消"));
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MyBottomSheet(params: params);
        });
  }
}
