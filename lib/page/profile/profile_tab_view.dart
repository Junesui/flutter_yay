import 'package:flutter/material.dart';
import 'package:imitate_yay/model/profile/profile_post_model.dart';
import 'package:imitate_yay/net/dao/profile_dao.dart';
import 'package:imitate_yay/page/profile/profile_follower_view.dart';
import 'package:imitate_yay/page/profile/profile_letter_view.dart';
import 'package:imitate_yay/page/profile/profile_post_view.dart';

/// 我的页面 TabView
class ProfileTabView extends StatefulWidget {
  // TabBar的索引
  final int index;

  const ProfileTabView({Key? key, required this.index}) : super(key: key);

  @override
  _ProfileTabViewState createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> {
  ProfilePostModel? profilePostModel;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.index == 0) {
      _getPostData();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // @override
  // bool get wantKeepAlive => true;

  /// 获取用户发布的信息
  _getPostData() async {
    await ProfileDao.getProfilePostData().then((model) {
      setState(() {
        profilePostModel = model;
        print("model --> $profilePostModel");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    switch (widget.index) {
      case 0:
        return profilePostModel == null
            ? const SizedBox()
            : ProfilePostView(profilePostModel: profilePostModel!);
      case 1:
        return const ProfileLetterView();
      case 2:
        return const ProfileFollowerView();
      case 3:
        return const ProfileFollowerView();
      default:
        return const SizedBox();
    }
  }
}
