import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/profile/profile_follower_model.dart';
import 'package:imitate_yay/net/dao/profile_dao.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 粉丝
class ProfileFollowerView extends StatefulWidget {
  const ProfileFollowerView({Key? key}) : super(key: key);

  @override
  _ProfileFollowerViewState createState() => _ProfileFollowerViewState();
}

class _ProfileFollowerViewState extends State<ProfileFollowerView>
    with AutomaticKeepAliveClientMixin {
  ProfileFollowerModel? profileFollowerModel;

  @override
  void initState() {
    super.initState();
    _getFollowerData();
  }

  @override
  bool get wantKeepAlive => true;

  /// 获取粉丝信息
  _getFollowerData() async {
    await ProfileDao.getProfileFollowerData().then((model) {
      setState(() {
        profileFollowerModel = model;
        print("---> $profileFollowerModel");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return profileFollowerModel?.users == null
        ? const SizedBox()
        : MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: ListView.builder(
                itemCount: profileFollowerModel!.users!.length,
                itemBuilder: (context, index) {
                  return _buildFollower(profileFollowerModel!.users![index]);
                },
              ),
            ),
          );
  }

  /// 粉丝子项
  _buildFollower(Users user) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 头像，昵称
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: SU.setHeight(60),
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
              avatar: Icon(
                Icons.done,
                color: Colors.white,
                size: 20,
              ),
              label: MyText(
                text: "已关注",
                fontSize: 35,
              ),
              backgroundColor: Colors.brown,
              side: BorderSide(
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
