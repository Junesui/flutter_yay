import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/constant/home_constant.dart';
import 'package:imitate_yay/model/home_calling_model.dart';
import 'package:imitate_yay/model/home_content_model.dart';
import 'package:imitate_yay/net/dao/home_dao.dart';
import 'package:imitate_yay/page/home/home_room_item.dart';
import 'package:imitate_yay/util/color_util.dart';
import 'package:imitate_yay/util/date_util.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 首页的 TabBarView
class HomeTabView extends StatefulWidget {
  final int type;

  const HomeTabView({Key? key, required this.type}) : super(key: key);

  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  // tabBar类型
  final List<int> _tabBarTypes = HomeConstant.tabbarTypes;
  // 通话中的实体
  HomeCallingModel callingModel = HomeCallingModel();
  // 用户发布内容的实体
  HomeContentModel contentModel = HomeContentModel();
  // 下拉刷新控制器
  final List<RefreshController> _refreshControllerList = [];

  @override
  void initState() {
    super.initState();
    for (final type in _tabBarTypes) {
      _refreshControllerList.add(RefreshController(initialRefresh: false));
    }
    _getHomeData();
  }

  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
  }

  // 回到顶部
  // backToTop() {
  //   _scrollController.jumpTo(0);
  // }

  // 获取聊天室房间
  _getHomeData() async {
    await HomeDao.getCallingTimeLine().then((model) {
      setState(() {
        callingModel = model;
      });
    });
    await HomeDao.getPostContent().then((model) {
      setState(() {
        contentModel = model;
      });
    });
  }

  // 下拉刷新
  _onRefresh() {
    print("_onRefresh");
    setState(() {});

    // int type = _tabController.index;
    //
    // _refreshControllerList[type].refreshCompleted();
    // _refreshControllerList[1].refreshCompleted();
    // print("--------_onRefresh--$type");
  }

  // 上拉加载
  _onLoading() {
    print("_onLoading");
    // setState(() {
    //   _publishContentList.add(_publishContentList.length);
    // });
    // if (mounted) setState(() {});
    // int type = _tabController.index;
    // _refreshControllerList[type].loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        child: SmartRefresher(
          enablePullUp: true,
          enablePullDown: true,
          controller: _refreshControllerList[_tabBarTypes.indexOf(widget.type)],
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView(
            // controller: _scrollController,
            children: [
              // 聊天室水平列表 只在公开tab下展示
              widget.type == HomeConstant.openType ? _buildChatRooms() : const SizedBox.shrink(),

              // 用户发表的内容列表
              _buildPublishContents(),
            ],
          ),
        ),
      ),
    );
  }

  /// 聊天室水平列表
  _buildChatRooms() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 8),
      height: ScreenUtil.setHeight(300),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.1,
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // 创建房间
          _buildChatRoomBothEnds(Icons.add_ic_call, "发布通话", 40, 30),
          // 中间房间列表
          ...?(callingModel.posts?.map<Widget>((post) {
            return HomeRoomItem(post: post);
          }).toList()),
          // 查看更多
          _buildChatRoomBothEnds(Icons.more_horiz, "查看更多", 50, 40),
        ],
      ),
    );
  }

  /// 聊天列表两端的子项
  _buildChatRoomBothEnds(IconData icon, String title, double left, double right) {
    return Container(
      margin: EdgeInsets.only(
        left: ScreenUtil.setWidth(left),
        right: ScreenUtil.setWidth(right),
        bottom: 2,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: ScreenUtil.setWidth(150),
                height: ScreenUtil.setHeight(150),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff545050), width: 2),
                  borderRadius: BorderRadius.circular(75),
                ),
                child: Icon(icon, color: Colors.green),
              ),
            ),
          ),
          MyText(
            text: title,
            color: Colors.grey,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  /// 用户发表的内容列表
  _buildPublishContents() {
    List<PostContents> postContents = [];
    contentModel.posts?.forEach((post) {
      if (post.postType == null) {
        postContents.add(post);
      }
    });
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.setWidth(40)),
      child: Column(
        children: postContents.map<Widget>((content) {
          return _buildPublishContent(content);
        }).toList(),
      ),
    );
  }

  /// 用户发表的内容列表子项
  _buildPublishContent(PostContents content) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white60,
            width: 0.1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧用户头像
          CircleAvatar(
            radius: ScreenUtil.setFontSize(60),
            backgroundImage:
                NetworkImage(content.user?.profileIconThumbnail ?? CommonConstant.defaultAvatar),
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
                    MyText(
                      text: "${content.user!.nickname}",
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                    // 发布时间
                    MyText(
                      text: DateUtil.format(content.createdAt!),
                      color: Colors.grey,
                      fontSize: 36,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // 发布内容
                MyText(
                  text: "${content.text}",
                  fontSize: 40,
                ),
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
                          _buildIconBtn(() {
                            print("--- click reply btn");
                          }, Icons.reply, 24),
                          _buildIconBtn(() {}, Icons.upload, 22),
                          _buildIconBtn(() {}, Icons.favorite, 18),
                        ],
                      ),
                    ),
                    // 右侧图标按钮
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildIconBtn(_buildMoreBottomSheet, Icons.more_vert, 24),
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

  // 图标按钮
  _buildIconBtn(VoidCallback onPressed, IconData icon, double size) {
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.grey,
          size: size,
        ));
  }

  // 点击更多按钮，弹出底部弹窗
  _buildMoreBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            decoration: const BoxDecoration(
              color: ColorUtil.primaryBackGroundColor,
            ),
            child: Wrap(
              children: [
                Column(
                  children: [
                    _buildMoreBottomSheetItem(() {}, Icons.do_not_disturb_on, "屏蔽该用户"),
                    _buildMoreBottomSheetItem(() {}, Icons.warning, "举报"),
                    _buildMoreBottomSheetItem(() {}, Icons.share, "分享"),
                    _buildMoreBottomSheetItem(() {}, Icons.sms, "聊天"),
                    _buildMoreBottomSheetItem(() {
                      Navigator.pop(context);
                    }, Icons.cancel, "取消"),
                  ],
                ),
              ],
            ),
          );
        });
  }

  _buildMoreBottomSheetItem(Function() onTap, IconData icon, String text) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            const SizedBox(width: 15),
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
