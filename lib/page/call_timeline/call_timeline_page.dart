import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/home/home_calling_model.dart';
import 'package:imitate_yay/net/dao/home_dao.dart';
import 'package:imitate_yay/util/date_util.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_appbar.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 更多 通话页
class CallTimelinePage extends StatefulWidget {
  const CallTimelinePage({Key? key}) : super(key: key);

  @override
  _CallTimelinePageState createState() => _CallTimelinePageState();
}

class _CallTimelinePageState extends State<CallTimelinePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // 通话中的实体
  HomeCallingModel callingModel = HomeCallingModel();

  // 两个tab
  List tabs = [0, 1];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _getChatRooms();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 获取聊天室房间 测试目的，所有和首页共用一个接口
  _getChatRooms() async {
    await HomeDao.getCallingTimeLine().then((model) {
      setState(() {
        callingModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(myTitle: "通話募集"),
      body: _buildBody(),
    );
  }

  /// Body
  _buildBody() {
    return Column(
      children: [
        _buildTabBar(),
        const Divider(color: Colors.white24, height: 0),
        const SizedBox(height: 8),
        Expanded(
          child: _buildTabBarView(),
        ),
      ],
    );
  }

  /// TabBar
  _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: CommonConstant.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: const <Widget>[
        SizedBox(
          height: 40,
          child: Tab(
            child: MyText(
              text: "フォロー中",
              color: Colors.grey,
              fontSize: 50,
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: Tab(
            child: MyText(
              text: "オーペン",
              color: Colors.grey,
              fontSize: 50,
            ),
          ),
        ),
      ],
    );
  }

  /// TabBarView
  _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: tabs.map<Widget>((index) {
        return _buildChatRooms(index);
      }).toList(),
    );
  }

  /// 房间列表
  _buildChatRooms(int index) {
    int len = callingModel.posts?.length ?? 0;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListView.builder(
        itemCount: len,
        itemBuilder: (context, index) {
          return _buildChatRoomItem(callingModel.posts![index]);
        },
      ),
    );
  }

  /// 房间子项
  _buildChatRoomItem(Posts post) {
    User user = post.user ?? User();
    return Container(
      margin: EdgeInsets.fromLTRB(
        SU.setWidth(CommonConstant.mainLRPadding),
        0,
        SU.setWidth(CommonConstant.mainLRPadding),
        15,
      ),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white24,
            width: 0.3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧用户头像
          CircleAvatar(
            radius: SU.setHeight(60),
            backgroundColor: Colors.transparent,
            backgroundImage: MyCacheNetImg.provider(user.profileIconThumbnail ?? ""),
          ),
          const SizedBox(width: 12),
          // 右侧内容
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 用户昵称和发布时间
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 用户昵称
                    Expanded(
                      child: MyText(
                        text: user.nickname ?? "",
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // 发布时间
                    MyText(
                      text: DateUtil.format(post.createdAt!),
                      color: Colors.grey,
                      fontSize: 36,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // 发布内容
                _buildPostContent(post, user),

                const SizedBox(height: 10),
                // 底部按钮
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 左侧三个图标按钮
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyIconBtn(
                            onPressed: () {
                              print("--- click reply btn");
                            },
                            icon: Icons.reply,
                          ),
                          MyIconBtn(
                            onPressed: () {
                              print("--- click rePost btn");
                            },
                            icon: Icons.upload,
                          ),
                          MyIconBtn(
                            onPressed: () {
                              print("--- click like btn");
                            },
                            icon: Icons.favorite,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                    // 右侧图标按钮
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyIconBtn(
                            onPressed: _buildMoreBottomSheet,
                            icon: Icons.more_vert,
                            size: 70,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 发布的内容
  _buildPostContent(Posts post, User user) {
    if (post.postType == CommonConstant.postTypCall) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 文字
          post.text?.trim() == ""
              ? const SizedBox()
              : MyText(
                  text: "${post.text}",
                  fontSize: 40,
                ),
          // 通話枠
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 通话图标
                CircleAvatar(
                  radius: SU.setHeight(50),
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    size: SU.setFontSize(55),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: "だれビのメンバー募集",
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 5),
                      const MyText(
                        text: "現在４人参加中！",
                        fontSize: 28,
                      ),
                      const SizedBox(height: 5),
                      post.conferenceCall?.conferenceCallUsers == null
                          ? const SizedBox()
                          : Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children:
                                  post.conferenceCall!.conferenceCallUsers!.map<Widget>((cllUser) {
                                if (cllUser.id == user.id) {
                                  return Stack(
                                    children: [
                                      // 头像
                                      CircleAvatar(
                                        radius: SU.setHeight(42),
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: MyCacheNetImg.provider(
                                            cllUser.profileIconThumbnail ?? ""),
                                      ),
                                      // 房主图标
                                      CircleAvatar(
                                        radius: SU.setHeight(18),
                                        backgroundColor: CommonConstant.primaryColor,
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.white,
                                          size: SU.setFontSize(26),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return CircleAvatar(
                                    radius: SU.setHeight(42),
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        MyCacheNetImg.provider(cllUser.profileIconThumbnail ?? ""),
                                  );
                                }
                              }).toList(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  /// 点击更多按钮，弹出底部弹窗
  _buildMoreBottomSheet() {
    List<BottomSheetParam> params = [];
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.do_not_disturb_on, text: "屏蔽该用户"));
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.warning, text: "举报"));
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
