import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/profile/profile_follower_model.dart';
import 'package:imitate_yay/net/dao/profile_dao.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_appbar.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 邀请通话列表页面
class CallingInvitePage extends StatefulWidget {
  const CallingInvitePage({Key? key}) : super(key: key);

  @override
  _CallingInvitePageState createState() => _CallingInvitePageState();
}

class _CallingInvitePageState extends State<CallingInvitePage> {
  // 搜索输入框控制器
  final TextEditingController _editingController = TextEditingController();

  // 粉丝
  ProfileFollowerModel? _followerModel;

  @override
  void initState() {
    super.initState();
    _getFollowerData();
  }

  /// 获取粉丝数据
  _getFollowerData() async {
    await ProfileDao.getProfileFollowerData().then((model) {
      setState(() {
        _followerModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(myTitle: "フォロー中から招待"),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomInviteOnlineFollower(),
    );
  }

  /// Body
  _buildBody() {
    return Column(
      children: [
        _buildSearchInput(),
        _buildDivider(),
        Expanded(child: _buildFollowers()),
      ],
    );
  }

  /// 搜索输入框
  _buildSearchInput() {
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(SU.setHeight(80)),
      borderSide: BorderSide.none,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
      child: SizedBox(
        height: 46,
        child: TextFormField(
          controller: _editingController,
          cursorColor: CommonConstant.primaryColor,
          textAlignVertical: TextAlignVertical.center,
          minLines: 1,
          maxLength: 20,
          style: TextStyle(
            color: Colors.white,
            fontSize: SU.setFontSize(42),
          ),
          decoration: InputDecoration(
            counterText: "",
            hintText: "ニックネームで検索",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: SU.setFontSize(40),
            ),
            filled: true,
            fillColor: Colors.black26,
            focusedBorder: _outlineInputBorder,
            isCollapsed: true,
            contentPadding: EdgeInsets.only(
              left: SU.setWidth(60),
              right: SU.setWidth(10),
            ),
            border: _outlineInputBorder,
            suffixIcon: MyIconBtn(
              onPressed: () {},
              icon: Icons.search,
              color: Colors.white70,
              size: 62,
            ),
          ),
        ),
      ),
    );
  }

  /// 水平分割线
  _buildDivider() {
    return const Divider(
      color: Colors.white12,
      thickness: 1,
    );
  }

  /// 粉丝列表
  _buildFollowers() {
    List<Users> users = _followerModel?.users ?? [];
    return users.isEmpty
        ? const SizedBox()
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return _buildFollowerItem(users[index]);
            },
          );
  }

  /// 粉丝子项
  _buildFollowerItem(Users user) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SU.setWidth(CommonConstant.mainLRPadding),
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 头像，昵称
              Expanded(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: SU.setHeight(60),
                      backgroundColor: Colors.transparent,
                      backgroundImage: MyCacheNetImg.provider(user.profileIconThumbnail ?? ""),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyText(
                        text: user.nickname ?? "",
                        fontSize: 45,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              // 关注按钮
              const Chip(
                backgroundColor: CommonConstant.primaryBackGroundColor,
                side: BorderSide(
                  color: CommonConstant.primaryColor,
                ),
                avatar: Icon(
                  Icons.person_add,
                  color: CommonConstant.primaryColor,
                  size: 20,
                ),
                label: MyText(
                  text: "招待",
                  fontSize: 35,
                  color: CommonConstant.primaryColor,
                ),
              ),
            ],
          ),
        ),
        _buildDivider(),
      ],
    );
  }

  /// 要求所有在线用户
  _buildBottomInviteOnlineFollower() {
    return Container(
      width: SU.getScreenWidth(),
      height: SU.setHeight(160),
      color: Colors.teal,
      child: const Center(
        child: MyText(
          text: "オンラインの友達をまとめ招待",
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
