import 'package:flutter/material.dart';
import 'package:imitate_yay/model/home/home_calling_model.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 首页聊天室子项
class HomeRoomItem extends StatelessWidget {
  final Posts post;

  const HomeRoomItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int joinUserCnt = post.conferenceCall?.conferenceCallUsers?.length ?? 0;
    if (joinUserCnt == 0) return const SizedBox.shrink();
    return Container(
      width: ScreenUtil.setWidth(200),
      height: ScreenUtil.setWidth(200),
      margin: const EdgeInsets.only(left: 12),
      child: Column(
        children: [
          // 聊天室封面
          Expanded(
            flex: 1,
            child: _buildRoomCover(joinUserCnt),
          ),
          const SizedBox(height: 5),
          // 参加人数
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(ScreenUtil.setWidth(20))),
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: ScreenUtil.setFontSize(20),
                ),
              ),
              const SizedBox(width: 5),
              MyText(
                text: "$joinUserCnt人参加中",
                color: Colors.grey,
                fontSize: 28,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 根据参加用户数量展示不同的聊天室封面
  _buildRoomCover(int joinUserCnt) {
    switch (joinUserCnt) {
      case 1:
        String avatarUrl = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ?? "";
        return PhysicalModel(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
              color: Colors.transparent,
            ),
            child: MyCacheNetImg(imgUrl: avatarUrl),
          ),
        );

      case 2:
        String avatarUrl1 = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ?? "";
        String avatarUrl2 = post.conferenceCall?.conferenceCallUsers![1].profileIconThumbnail ?? "";

        return PhysicalModel(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                _buildExpandedAvatar(avatarUrl1),
                _buildExpandedAvatar(avatarUrl2),
              ],
            ),
          ),
        );
      case 3:
        String avatarUrl1 = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ?? "";
        String avatarUrl2 = post.conferenceCall?.conferenceCallUsers![1].profileIconThumbnail ?? "";
        String avatarUrl3 = post.conferenceCall?.conferenceCallUsers![2].profileIconThumbnail ?? "";
        return PhysicalModel(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildExpandedAvatar(avatarUrl1),
                      _buildExpandedAvatar(avatarUrl2),
                    ],
                  ),
                ),
                _buildExpandedAvatar(avatarUrl3),
              ],
            ),
          ),
        );
      default:
        String avatarUrl1 = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ?? "";
        String avatarUrl2 = post.conferenceCall?.conferenceCallUsers![1].profileIconThumbnail ?? "";
        String avatarUrl3 = post.conferenceCall?.conferenceCallUsers![2].profileIconThumbnail ?? "";
        String avatarUrl4 = post.conferenceCall?.conferenceCallUsers![3].profileIconThumbnail ?? "";
        return PhysicalModel(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil.setHeight(40)),
              color: Colors.transparent,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildExpandedAvatar(avatarUrl1),
                      _buildExpandedAvatar(avatarUrl2),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildExpandedAvatar(avatarUrl3),
                      _buildExpandedAvatar(avatarUrl4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }

  // 头像
  _buildExpandedAvatar(String avatarUrl) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: MyCacheNetImg(imgUrl: avatarUrl),
      ),
    );
  }
}
