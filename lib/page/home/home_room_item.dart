import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/home_calling_model.dart';
import 'package:imitate_yay/util/screen_util.dart';
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
        String avatarUrl = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.transparent,
            image: DecorationImage(
              image: NetworkImage(avatarUrl),
              fit: BoxFit.cover,
            ),
          ),
        );

      case 2:
        String avatarUrl1 = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
        String avatarUrl2 = post.conferenceCall?.conferenceCallUsers![1].profileIconThumbnail ??
            CommonConstant.defaultAvatar;

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
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(avatarUrl1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(avatarUrl2),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      case 3:
        String avatarUrl1 = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
        String avatarUrl2 = post.conferenceCall?.conferenceCallUsers![1].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
        String avatarUrl3 = post.conferenceCall?.conferenceCallUsers![2].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
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
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(avatarUrl1),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(avatarUrl2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(avatarUrl3),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      default:
        String avatarUrl1 = post.conferenceCall?.conferenceCallUsers![0].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
        String avatarUrl2 = post.conferenceCall?.conferenceCallUsers![1].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
        String avatarUrl3 = post.conferenceCall?.conferenceCallUsers![2].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
        String avatarUrl4 = post.conferenceCall?.conferenceCallUsers![3].profileIconThumbnail ??
            CommonConstant.defaultAvatar;
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
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(avatarUrl1),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(avatarUrl2),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(avatarUrl3),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(avatarUrl4),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
