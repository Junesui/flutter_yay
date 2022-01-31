import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/profile/profile_model.dart';
import 'package:imitate_yay/net/dao/profile_dao.dart';
import 'package:imitate_yay/page/profile/profile_tab_view.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  ProfileModel? profileModel;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 设置状态栏背景色
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0x55000000)));
    _tabController = TabController(length: 4, vsync: this);
    _getProfileData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// 获取基本信息
  _getProfileData() async {
    await ProfileDao.getProfileData().then((model) {
      setState(() {
        profileModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileModel?.user == null ? const SizedBox() : _buildNestedScrollView(),
    );
  }

  /// NestedScrollView
  _buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        User user = profileModel!.user!;
        return <Widget>[
          _buildSliverAppBar(user),
          // 间距
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          // tabbar区域
          _buildTabBar(user),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProfileTabView(index: 0),
          ProfileTabView(index: 1),
          ProfileTabView(index: 2),
          ProfileTabView(index: 3),
        ],
      ),
    );
  }

  /// AppBar
  _buildSliverAppBar(User user) {
    return SliverAppBar(
      toolbarHeight: 50,
      shadowColor: Colors.grey,
      elevation: 0.8,
      backgroundColor: CommonConstant.primaryBackGroundColor,
      pinned: true,
      expandedHeight: SU.setHeight(720),
      leading: Center(
        child: MyText(
          text: user.nickname ?? "",
          fontSize: 50,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: SU.setWidth(CommonConstant.mainLRPadding)),
          child: Icon(
            Icons.settings,
            size: SU.setFontSize(60),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Column(
          children: [
            // 背景区域
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            // 背景图片
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: MyCacheNetImg(imgUrl: user.coverImageThumbnail ?? ""),
                                ),
                              ],
                            ),
                            // 是否认证
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: _buildVerfied(user.ageVerified ?? false),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 占位
                      const Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  // 头像区域
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // 头像
                        ClipOval(
                          child: SizedBox(
                            height: SU.setHeight(260),
                            child: MyCacheNetImg(imgUrl: user.profileIconThumbnail ?? ""),
                          ),
                        ),
                        // 用户名
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: MyText(
                            text: user.nickname ?? "",
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 个性签名
            Padding(
              padding: EdgeInsets.fromLTRB(
                SU.setWidth(CommonConstant.mainLRPadding),
                10,
                SU.setWidth(CommonConstant.mainLRPadding),
                0,
              ),
              child: MyText(
                text: user.biography ?? "",
                fontSize: 40,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// TabBar
  _buildTabBar(User user) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        child: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          decoration: const BoxDecoration(
            color: CommonConstant.primaryBackGroundColor,
            border: Border(
              bottom: BorderSide(
                width: 0.2,
                color: Colors.white24,
              ),
            ),
          ),
          child: TabBar(
            controller: _tabController,
            labelPadding: EdgeInsets.zero,
            labelColor: CommonConstant.primaryColor,
            unselectedLabelColor: Colors.white24,
            indicator: const BoxDecoration(
              color: Colors.transparent,
            ),
            tabs: [
              _buildTabBarItem("投稿", user.postsCount ?? 0, true),
              _buildTabBarItem("レター", user.reviewsCount ?? 0, true),
              _buildTabBarItem("フォロワー", user.followersCount ?? 0, true),
              _buildTabBarItem("フォロー中", user.followingsCount ?? 0, false),
            ],
          ),
        ),
      ),
    );
  }

  /// 是否认证图标
  _buildVerfied(bool verfied) {
    return Chip(
      backgroundColor: verfied ? Colors.green : Colors.orange,
      avatar: Icon(
        verfied ? Icons.done : Icons.error_outline,
        size: 18,
        color: Colors.white,
      ),
      label: Text(
        verfied ? "已认证" : "未认证",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      labelPadding: const EdgeInsets.only(left: 0, right: 5),
      visualDensity: VisualDensity.compact,
    );
  }

  /// TabBar Item
  _buildTabBarItem(String text, int count, bool rightBorder) {
    return Container(
      width: SU.getScreenWidth() / 4,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 0.2,
            color: rightBorder ? Colors.white24 : Colors.transparent,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText(
            text: text,
            color: null,
            fontSize: 36,
          ),
          MyText(
            text: count.toString(),
            color: Colors.white24,
            fontSize: 36,
          ),
        ],
      ),
    );
  }
}

/// 吸顶 TabBar代理
class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
