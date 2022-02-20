import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/constant/home_constant.dart';
import 'package:imitate_yay/model/home/home_calling_model.dart';
import 'package:imitate_yay/model/home/home_content_model.dart';
import 'package:imitate_yay/net/dao/home_dao.dart';
import 'package:imitate_yay/router/router_name.dart';
import 'package:imitate_yay/util/date_util.dart';
import 'package:imitate_yay/util/dialog_util.dart';
import 'package:imitate_yay/util/event_bus_util.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_loading_container.dart';
import 'package:imitate_yay/widget/my_pull_to_refresh.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_float_room.dart';
import 'home_room_item.dart';

/// 首页的 TabBarView
class HomeTabView extends StatefulWidget {
  final int type;

  const HomeTabView({Key? key, required this.type}) : super(key: key);

  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> with AutomaticKeepAliveClientMixin {
  // tabBar类型
  final List<int> _tabBarTypes = HomeConstant.tabbarTypes;
  // 通话中的实体
  HomeCallingModel callingModel = HomeCallingModel();
  // 用户发布内容的实体
  HomeContentModel contentModel = HomeContentModel();
  List<PostContents> postContents = [];
  // 下拉刷新控制器
  final List<RefreshController> _refreshControllerList = [];
  // 列表滚动控制器
  final ScrollController _scrollController = ScrollController();
  // 数据加载状态
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // 初始化下拉刷新控制器
    for (final type in _tabBarTypes) {
      _refreshControllerList.add(RefreshController(initialRefresh: false));
    }
    // 监听首页滚到顶部事件
    EventBusUtil.listen<HomeBackToTopEvent>((event) {
      if (postContents.length > 30) {
        setState(() {
          postContents.removeRange(30, postContents.length);
        });
      }
      _scrollController.jumpTo(0);
    });

    _getHomeData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  // 获取首页数据
  _getHomeData() async {
    await _getChatRooms();
    await _getPostContents();
    setState(() {
      _isLoading = false;
    });
  }

  // 获取聊天室房间
  _getChatRooms() async {
    await HomeDao.getCallingTimeLine().then((model) {
      setState(() {
        callingModel = model;
      });
    });
  }

  // 获取发表的内容
  _getPostContents({bool isLoadMore = false}) async {
    await HomeDao.getPostContent().then((model) {
      setState(() {
        if (isLoadMore) {
          contentModel.posts?.addAll(model.posts ?? []);
        } else {
          contentModel = model;
          postContents = [];
        }
        contentModel.posts?.forEach((post) {
          if (post.postType == null) {
            postContents.add(post);
          }
        });
      });
    });
  }

  // 下拉刷新
  _onRefresh() {
    int index = HomeConstant.tabbarTypes.indexOf(widget.type);
    try {
      _getChatRooms();
      _getPostContents();
      _refreshControllerList[index].refreshCompleted();
    } catch (e) {
      _refreshControllerList[index].refreshFailed();
    }
  }

  // 上拉加载
  _onLoading() {
    int index = HomeConstant.tabbarTypes.indexOf(widget.type);
    try {
      _getPostContents(isLoadMore: true);
      if (mounted) setState(() {});
      _refreshControllerList[index].loadComplete();
    } catch (e) {
      _refreshControllerList[index].loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MyLoadingContainer(
      isLoading: _isLoading,
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: MyPullToRefresh(
            refreshController: _refreshControllerList[_tabBarTypes.indexOf(widget.type)],
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
                controller: _scrollController,
                itemCount: postContents.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildChatRooms();
                  } else {
                    return _buildPublishContent(postContents[index - 1]);
                  }
                }),
          ),
        ),
      ),
    );
  }

  /// 聊天室水平列表
  _buildChatRooms() {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 8),
      height: SU.setHeight(300),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.1,
          ),
        ),
      ),
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          // 创建房间
          SliverToBoxAdapter(
            child: _buildChatRoomBothEnds(Icons.add_ic_call, () {
              _buildPostCall();
            }, "发布通话", 40, 30),
          ),
          // 中间房间列表
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return callingModel.posts == null
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return HomeFloatRoom(posts: callingModel.posts!, index: index);
                              });
                        },
                        child: HomeRoomItem(post: callingModel.posts![index]),
                      );
              },
              childCount: callingModel.posts?.length ?? 0,
            ),
          ),
          // 查看更多
          SliverToBoxAdapter(
            child: _buildChatRoomBothEnds(Icons.more_horiz, () {
              Navigator.of(context).pushNamed(RouterName.callTimeline);
            }, "查看更多", 50, 40),
          ),
        ],
      ),
    );
  }

  /// 聊天列表两端的子项
  _buildChatRoomBothEnds(
      IconData icon, VoidCallback onTap, String title, double left, double right) {
    return Container(
      margin: EdgeInsets.only(
        left: SU.setWidth(left),
        right: SU.setWidth(right),
        bottom: 2,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: SU.setWidth(150),
                  height: SU.setHeight(150),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff545050), width: 2),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: Icon(icon, color: Colors.green),
                ),
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

  /// 用户发表的内容列表子项
  _buildPublishContent(PostContents content) {
    return Container(
      padding: EdgeInsets.only(
        left: SU.setWidth(CommonConstant.mainLRPadding),
        right: SU.setWidth(CommonConstant.mainLRPadding),
        bottom: 8,
      ),
      margin: const EdgeInsets.only(top: 15),
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouterName.userInfo,
                arguments: {"id": content.user!.id},
              );
            },
            child: CircleAvatar(
              backgroundImage: MyCacheNetImg.provider(content.user?.profileIconThumbnail ?? ""),
              backgroundColor: Colors.transparent,
              radius: SU.setHeight(50),
            ),
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
                        text: "${content.user!.nickname}",
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 10),
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
                          // 点赞
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
                            onPressed: () {
                              _buildMoreBottomSheet(content);
                            },
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

  /// 发布通话
  _buildPostCall() {
    List<BottomSheetParam> params = [];
    params.add(BottomSheetParam(
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(RouterName.calling);
        },
        icon: Icons.call,
        text: "だれでも通話"));
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.video_call, text: "だれでもビデオ"));
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MyBottomSheet(params: params);
        });
  }

  /// 更多按钮
  _buildMoreBottomSheet(PostContents content) {
    List<BottomSheetParam> params = [];
    // 屏蔽
    params.add(
      BottomSheetParam(
          onTap: () {
            DialogUtil.show(context, text: "确定屏蔽此用户？", btnOkOnPress: () {
              print("send block request !");
            });
          },
          icon: Icons.block,
          text: "ブロックする"),
    );
    // 举报
    params.add(
      BottomSheetParam(
          onTap: () {
            Navigator.of(context).pushNamed(
              RouterName.report,
              arguments: {"content": content},
            );
          },
          icon: Icons.warning,
          text: "通報する"),
    );
    // 聊天
    params.add(
      BottomSheetParam(onTap: () {}, icon: FontAwesome.commenting, text: "チャットする"),
    );
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MyBottomSheet(params: params);
        });
  }
}
