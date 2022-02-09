import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/search/search_hima_users_model.dart';
import 'package:imitate_yay/net/dao/search_dao.dart';
import 'package:imitate_yay/page/search/search_float_user.dart';
import 'package:imitate_yay/page/search/search_input.dart';
import 'package:imitate_yay/router/router_name.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_loading_container.dart';
import 'package:imitate_yay/widget/my_pull_to_refresh.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';

/// 搜索页面
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final RefreshController _refreshController = RefreshController();
  SearchHimaUsersModel? searchHimaUsersModel;
  // 是否隐藏分享区域
  bool _isHideShare = false;
  // 加载状态
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getHimaUsers();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  /// 获取空闲用户数据
  _getHimaUsers() async {
    await SearchDao.getHimaUsers().then((model) {
      setState(() {
        searchHimaUsersModel = model;
        _isLoading = false;
      });
    });
  }

  /// 刷新
  _onRefresh() {
    _refreshController.refreshCompleted();
  }

  /// 加载更多
  _onLoading() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonConstant.primaryBackGroundColor,
      appBar: _buildAppBar(),
      body: MyLoadingContainer(
        isLoading: _isLoading,
        child: MyPullToRefresh(
          refreshController: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: CustomScrollView(
            slivers: [
              // 水平列表
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    _buildHorizontalUser(),
                    const Divider(color: Colors.white24, thickness: 0.5, height: 20)
                  ],
                ),
              ),
              // 外部应用添加朋友
              SliverToBoxAdapter(
                child: _buildShare(),
              ),
              // 用户卡片
              SliverToBoxAdapter(
                child: _buildUserCards(searchHimaUsersModel?.himaUsers ?? []),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildSearchBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  /// appBar
  _buildAppBar() {
    return AppBar(
      leading: MyIconBtn(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icons.arrow_back_ios,
      ),
      title: MyText(
        text: "検索",
        fontSize: SU.setFontSize(150),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: SU.setWidth(CommonConstant.mainLRPadding)),
          child: MyIconBtn(
            onPressed: () {
              Navigator.of(context).pushNamed(RouterName.qr);
            },
            icon: Icons.qr_code,
            size: SU.setFontSize(180),
          ),
        )
      ],
      backgroundColor: CommonConstant.primaryBackGroundColor,
    );
  }

  /// 水平用户列表区域
  _buildHorizontalUser() {
    return SizedBox(
      height: SU.setHeight(300),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SU.setWidth(CommonConstant.mainLRPadding),
          10,
          SU.setWidth(CommonConstant.mainLRPadding),
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 标题文字
            const MyText(
              text: "今ひまなユーザーたち",
              fontSize: 32,
            ),
            // 水平列表
            Expanded(
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  // ひまなう
                  SliverToBoxAdapter(
                    child: _buildUserListBothEnds(Icons.free_breakfast, "ひまなう", 0, 30),
                  ),
                  // 中间房间列表
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        List<HimaUsers> himaUsers = searchHimaUsersModel?.himaUsers ?? [];
                        return himaUsers.isEmpty ? const SizedBox() : _buildUser(himaUsers[index]);
                      },
                      childCount: 10,
                    ),
                  ),
                  // 查看更多
                  SliverToBoxAdapter(
                    child: _buildUserListBothEnds(Icons.more_horiz, "もっと見る", 50, 0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 用户水平列表两端的子项
  _buildUserListBothEnds(IconData icon, String title, double left, double right) {
    return Container(
      margin: EdgeInsets.only(
        left: SU.setWidth(left),
        right: SU.setWidth(right),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
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

  /// 用户水平列表子项
  _buildUser(HimaUsers user) {
    return SizedBox(
      width: SU.setWidth(210),
      height: SU.setHeight(150),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      List<HimaUsers> himaUsers = searchHimaUsersModel!.himaUsers!;
                      int index = himaUsers.indexOf(user);
                      return SearchFloatUser(himaUsers: himaUsers, index: index);
                    });
              },
              child: CircleAvatar(
                radius: SU.setHeight(72),
                backgroundColor: Colors.transparent,
                backgroundImage: MyCacheNetImg.provider(user.user?.profileIconThumbnail ?? ""),
              ),
            ),
          ),
          MyText(
            text: user.user?.nickname ?? "",
            fontSize: 30,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  /// 分享区域
  _buildShare() {
    return Offstage(
      offstage: _isHideShare,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SU.setWidth(CommonConstant.mainLRPadding),
          3,
          SU.setWidth(CommonConstant.mainLRPadding * 2),
          0,
        ),
        child: Column(
          children: [
            // 文字和关闭按钮
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: MyText(
                    text: "友達を追加",
                    fontSize: 42,
                  ),
                ),
                MyIconBtn(
                  onPressed: () {
                    setState(() {
                      _isHideShare = true;
                    });
                  },
                  icon: Icons.close,
                  size: 80,
                  color: Colors.white24,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 分享图标
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildShareIcon(),
                _buildExternalAppIcon(FontAwesome.wechat, Colors.green),
                _buildExternalAppIcon(FontAwesome.qq, Colors.blue),
                _buildExternalAppIcon(FontAwesome.twitter, Colors.lightBlueAccent),
              ],
            ),
          ],
        ),
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
      child: MyIconBtn(
        onPressed: () {
          Share.share('シェア.https://xxxx');
        },
        icon: Icons.share,
        color: CommonConstant.primaryColor,
        size: SU.setFontSize(150),
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

  /// 用户瀑布流卡片列表
  _buildUserCards(List<HimaUsers> users) {
    return users.isEmpty
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: MasonryGridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              itemBuilder: (context, index) {
                return _buildUserCard(users[index]);
              },
              itemCount: users.length,
            ),
          );
  }

  /// 用户瀑布流卡片子项
  _buildUserCard(HimaUsers user) {
    return Card(
      shadowColor: Colors.white24,
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // 背景图，头像，更多按钮
          SizedBox(
            height: SU.getScreenWidth() / 4 + SU.setHeight(60),
            width: double.infinity,
            child: Stack(
              children: [
                // 封面图
                Container(
                  height: SU.getScreenWidth() / 4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                    backgroundImage: MyCacheNetImg.provider(user.user?.profileIconThumbnail ?? ""),
                  ),
                ),
                // 更多按钮
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: MyIconBtn(
                      onPressed: _buildMoreBottomSheet,
                      icon: Icons.more_vert,
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
        ],
      ),
    );
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

  /// 悬浮搜素按钮
  _buildSearchBtn() {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return const Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                child: SearchInput(),
              );
            });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: SU.setFontSize(60),
          ),
          const SizedBox(width: 5),
          const MyText(
            text: "搜索",
            fontSize: 42,
          ),
        ],
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: SU.setWidth(80),
            vertical: 10,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(CommonConstant.primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
