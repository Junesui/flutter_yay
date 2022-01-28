import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/profile/profile_letter_model.dart';
import 'package:imitate_yay/net/dao/profile_dao.dart';
import 'package:imitate_yay/util/date_util.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 留言
class ProfileLetterView extends StatefulWidget {
  const ProfileLetterView({Key? key}) : super(key: key);

  @override
  _ProfileLetterViewState createState() => _ProfileLetterViewState();
}

class _ProfileLetterViewState extends State<ProfileLetterView> with AutomaticKeepAliveClientMixin {
  ProfileLetterModel? profileLetterModel;

  @override
  void initState() {
    super.initState();
    _getLetterData();
  }

  @override
  bool get wantKeepAlive => true;

  /// 获取留言信息
  _getLetterData() async {
    await ProfileDao.getProfileLetterData().then((model) {
      setState(() {
        profileLetterModel = model;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return profileLetterModel?.reviews == null
        ? const SizedBox()
        : MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: profileLetterModel!.reviews!.length,
              itemBuilder: (context, index) {
                return _buildLetter(profileLetterModel!.reviews![index]);
              },
            ),
          );
  }

  /// 留言子项
  _buildLetter(Reviews review) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头像，昵称 时间
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 头像和昵称
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: SU.setHeight(50),
                        backgroundImage:
                            MyCacheNetImg.provider(review.reviewer?.profileIconThumbnail ?? ""),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: MyText(
                          text: review.reviewer?.nickname ?? "",
                          fontSize: 42,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // 时间
                MyText(
                  text: DateUtil.format(review.createdAt ?? 0).toString(),
                  fontSize: 38,
                  color: Colors.white38,
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 留言内容
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 7,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: MyText(
                      text: review.comment ?? "",
                      fontSize: 42,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: MyIconBtn(
                      onPressed: () {
                        _buildMoreBottomSheet();
                      },
                      icon: Icons.more_vert,
                      size: 68,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
}
