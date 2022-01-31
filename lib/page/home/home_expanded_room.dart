import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/home/home_calling_model.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 首页点击聊天室，弹出展开的聊天室弹窗
class HomeExpandedRoom extends StatefulWidget {
  final List<Posts> posts;
  final int index;

  const HomeExpandedRoom({Key? key, required this.posts, required this.index}) : super(key: key);

  @override
  _HomeExpandedRoomState createState() => _HomeExpandedRoomState();
}

class _HomeExpandedRoomState extends State<HomeExpandedRoom> {
  late PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SU.setHeight(600),
      width: SU.getScreenWidth() * 0.85,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: widget.posts.map<Widget>((post) {
          return _buildRoom(post);
        }).toList(),
      ),
    );
  }

  /// 弹窗聊天室子项
  _buildRoom(Posts post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: CommonConstant.primaryBackGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15),
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
              const SizedBox(height: 5),
              // 标题
              MyText(
                text: post.text ?? "",
                color: Colors.grey,
                fontSize: 40,
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              // 头像
              post.conferenceCall?.conferenceCallUsers == null
                  ? CircleAvatar(
                      backgroundImage: const AssetImage("assets/images/avatar.jpg"),
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
                              ClipOval(
                                child: SizedBox(
                                  height: SU.setHeight(90),
                                  width: SU.setWidth(90),
                                  child: MyCacheNetImg(imgUrl: callUser.profileIconThumbnail ?? ""),
                                ),
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
                          return ClipOval(
                            child: SizedBox(
                              height: SU.setHeight(90),
                              width: SU.setWidth(90),
                              child: MyCacheNetImg(imgUrl: callUser.profileIconThumbnail ?? ""),
                            ),
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
                        SU.setFontSize(50),
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
    );
  }

  /// 点击更多按钮，弹出底部弹窗
  _buildMoreBottomSheet() {
    print(" --> _buildMoreBottomSheet");
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
