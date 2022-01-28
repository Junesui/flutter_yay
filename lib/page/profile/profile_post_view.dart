import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/profile/profile_post_model.dart';
import 'package:imitate_yay/util/date_util.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_img_cell.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 投稿内容
class ProfilePostView extends StatefulWidget {
  final ProfilePostModel profilePostModel;

  const ProfilePostView({Key? key, required this.profilePostModel}) : super(key: key);

  @override
  _ProfilePostViewState createState() => _ProfilePostViewState();
}

class _ProfilePostViewState extends State<ProfilePostView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    ProfilePostModel profilePostModel = widget.profilePostModel;
    return _buildPostView(profilePostModel);
  }

  /// 投稿
  _buildPostView(ProfilePostModel profilePostModel) {
    List<Posts> postImgList = [];
    postImgList = profilePostModel.posts
            ?.where((post) => post.postType == CommonConstant.postTypeImage)
            .toList() ??
        [];
    return Column(
      children: [
        // 投稿图片横向列表
        postImgList.isEmpty ? const SizedBox() : _buildPostImgs(postImgList),
        //投稿内容
        Expanded(
          child: _buildPosts(profilePostModel),
        ),
      ],
    );
  }

  /// 投稿水平图片一览
  _buildPostImgs(List<Posts> postImgList) {
    return Container(
      height: SU.setHeight(200),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: Colors.white24,
          ),
        ),
      ),
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          // 投稿图片
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildPostImg(
                    MyCacheNetImg(imgUrl: postImgList[index].attachmentThumbnail ?? ""));
              },
              childCount: postImgList.length,
            ),
          ),
          // 更多
          SliverToBoxAdapter(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SU.setHeight(20)),
                  border: Border.all(
                    color: Colors.white24,
                    width: 0.5,
                  ),
                ),
                child: Icon(
                  Icons.more_horiz,
                  color: CommonConstant.primaryColor,
                  size: SU.setFontSize(80),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 投稿水平图片子项
  _buildPostImg(Widget widget) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SU.setHeight(20)),
        child: AspectRatio(
          aspectRatio: 1,
          child: widget,
        ),
      ),
    );
  }

  /// 投稿内容列表
  _buildPosts(ProfilePostModel profilePostModel) {
    return ListView.builder(
        itemCount: profilePostModel.posts?.length ?? 0,
        itemBuilder: (context, index) {
          return _buildPost(profilePostModel, index);
        });
  }

  /// 投稿内容子项
  _buildPost(ProfilePostModel profilePostModel, int index) {
    Posts post = profilePostModel.posts![index];
    User user = post.user!;
    return Container(
      margin: EdgeInsets.fromLTRB(
        SU.setWidth(CommonConstant.mainLRPadding),
        0,
        SU.setWidth(CommonConstant.mainLRPadding),
        15,
      ),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white24,
            width: 0.3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 左侧用户头像
          ClipOval(
            child: SizedBox(
              height: SU.setHeight(120),
              width: SU.setWidth(120),
              child: MyCacheNetImg(imgUrl: user.profileIconThumbnail ?? ""),
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
                        text: "${user.nickname}",
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 10),
                    // 发布时间
                    MyText(
                      text: DateUtil.format(post.createdAt!),
                      color: Colors.grey,
                      fontSize: 36,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // 发布内容
                _buildPostContent(post, user),

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
                            onPressed: _buildMoreBottomSheet,
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

  /// 发布的内容
  _buildPostContent(Posts post, User user) {
    // TODO reply
    // 1. type -> null
    if (post.postType == null) {
      return MyText(
        text: "${post.text}",
        fontSize: 40,
      );
    }
    // 2. type -> call
    if (post.postType == CommonConstant.postTypCall) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 文字
          post.text?.trim() == ""
              ? const SizedBox()
              : MyText(
                  text: "${post.text}",
                  fontSize: 40,
                ),
          // 通話枠
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 通话图标
                ClipOval(
                  child: SizedBox(
                    height: SU.setHeight(70),
                    width: SU.setWidth(70),
                    child: Container(
                      color: Colors.grey,
                      child: Icon(
                        Icons.call_end,
                        color: Colors.white,
                        size: SU.setFontSize(42),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: "だれビが終了しました",
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 5),
                      const MyText(
                        text: "1人で１分通話したよ！",
                        fontSize: 28,
                      ),
                      const SizedBox(height: 5),
                      post.conferenceCall?.conferenceCallUsers == null
                          ? const SizedBox()
                          : Wrap(
                              children:
                                  post.conferenceCall!.conferenceCallUsers!.map<Widget>((cllUser) {
                                if (cllUser.id == user.id) {
                                  return Stack(
                                    children: [
                                      // 头像
                                      ClipOval(
                                        child: SizedBox(
                                          height: SU.setHeight(90),
                                          width: SU.setWidth(90),
                                          child: MyCacheNetImg(
                                              imgUrl: cllUser.profileIconThumbnail ?? ""),
                                        ),
                                      ),
                                      // 房主图标
                                      ClipOval(
                                        child: Container(
                                          height: SU.setHeight(40),
                                          width: SU.setWidth(40),
                                          color: CommonConstant.primaryColor,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: SU.setFontSize(32),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return ClipOval(
                                    child: SizedBox(
                                      height: SU.setHeight(70),
                                      width: SU.setWidth(70),
                                      child:
                                          MyCacheNetImg(imgUrl: cllUser.profileIconThumbnail ?? ""),
                                    ),
                                  );
                                }
                              }).toList(),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
    // 3. type -> image
    if (post.postType == CommonConstant.postTypeImage) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 文字
          post.text?.trim() == ""
              ? const SizedBox()
              : MyText(
                  text: "${post.text}",
                  fontSize: 40,
                ),
          const SizedBox(height: 5),
          _buildImgCell(post),
        ],
      );
    }
  }

  /// 根据发布图片的数量，不同排列方式
  _buildImgCell(Posts post) {
    List<String> imgUrlList = [];
    int imgCnt = 2;
    for (var i = 0; i < imgCnt; i++) {
      imgUrlList.add("https://picsum.photos/id/${i + 18}/300/520");
    }
    return MyImgCell(imgUrls: imgUrlList);
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
