import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/home/home_calling_model.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 首页点击聊天室，弹出悬浮的聊天室弹窗
class HomeFloatRoom extends StatefulWidget {
  final List<Posts> posts;
  final int index;

  const HomeFloatRoom({Key? key, required this.posts, required this.index}) : super(key: key);

  @override
  _HomeFloatRoomState createState() => _HomeFloatRoomState();
}

class _HomeFloatRoomState extends State<HomeFloatRoom> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: widget.posts.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildRoom(widget.posts[index]);
      },
      index: widget.index,
      loop: false,
      viewportFraction: 0.8,
      scale: 0.8,
    );
  }

  /// 弹窗聊天室子项
  _buildRoom(Posts post) {
    return Column(
      children: [
        _buildBlankPlaceHolder(),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: CommonConstant.primaryBackGroundColor,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 更多按钮
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyIconBtn(
                      onPressed: () {
                        _buildMoreBottomSheet();
                      },
                      icon: Icons.more_horiz,
                      size: 70,
                    ),
                  ),
                  const SizedBox(height: 3),
                  // 标题
                  MyText(
                    text: (post.text?.isEmpty ?? true) ? "默认标题" : post.text!,
                    color: Colors.grey,
                    fontSize: 40,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),
                  // 头像
                  post.conferenceCall?.conferenceCallUsers == null
                      ? CircleAvatar(
                          backgroundImage: const AssetImage("assets/images/avatar.jpg"),
                          backgroundColor: Colors.transparent,
                          radius: SU.setHeight(50),
                        )
                      : Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: post.conferenceCall!.conferenceCallUsers!.map((callUser) {
                            if (post.user?.id == callUser.id) {
                              return Stack(
                                children: [
                                  // 头像
                                  CircleAvatar(
                                    backgroundImage:
                                        MyCacheNetImg.provider(callUser.profileIconThumbnail ?? ""),
                                    backgroundColor: Colors.transparent,
                                    radius: SU.setHeight(50),
                                  ),

                                  // 房主图标
                                  ClipOval(
                                    child: Container(
                                      height: SU.setHeight(40),
                                      width: SU.setWidth(40),
                                      color: CommonConstant.primaryColor,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: SU.setFontSize(32),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return CircleAvatar(
                                backgroundImage:
                                    MyCacheNetImg.provider(callUser.profileIconThumbnail ?? ""),
                                backgroundColor: Colors.transparent,
                                radius: SU.setHeight(50),
                              );
                            }
                          }).toList(),
                        ),
                  const SizedBox(height: 10),
                  // 谁的通话，几人参加中
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MyText(
                          text: "${post.user?.nickname ?? "用户"}の通話",
                          fontSize: 40,
                          color: Colors.green,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      MyText(
                        text: "${post.conferenceCall?.conferenceCallUsers?.length ?? 0}人参加中",
                        fontSize: 33,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // 参加按钮
                  ElevatedButton(
                    onPressed: () {
                      print("join btn click");
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(CommonConstant.primaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SU.setHeight(100),
                          ),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.call,
                          size: SU.setFontSize(70),
                        ),
                        const SizedBox(width: 10),
                        const MyText(
                          text: "加 入",
                          fontSize: 42,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
