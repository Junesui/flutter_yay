import 'package:flutter/material.dart';
import 'package:imitate_yay/model/profile/profile_post_model.dart';
import 'package:imitate_yay/net/dao/profile_dao.dart';

class ProfileTabView extends StatefulWidget {
  // TabBar的索引
  final int index;

  const ProfileTabView({Key? key, required this.index}) : super(key: key);

  @override
  _ProfileTabViewState createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<ProfileTabView> with AutomaticKeepAliveClientMixin {
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

  @override
  bool get wantKeepAlive => true;

  /// 获取用户发布的信息
  _getPostData() async {
    await ProfileDao.getProfilePostData().then((model) {
      setState(() {
        profilePostModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.index) {
      case 0:
        return _buildPostView();
      case 1:
        return Container(color: Colors.orange[900]);
      case 2:
        return Container(color: Colors.orange[600]);
      case 3:
        return Container(color: Colors.orange[400]);
      default:
        return Container(color: Colors.orange[200]);
    }
  }

  /// 投稿
  _buildPostView() {
    return ListView(
      children: [
        // 发布的图片
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 0.2,
                color: Colors.white24,
              ),
            ),
          ),
          child: ListView(
            children: [
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Text("");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
