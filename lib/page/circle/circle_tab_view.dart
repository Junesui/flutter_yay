import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/circle/circle_category_model.dart';
import 'package:imitate_yay/model/circle/circle_group_model.dart';
import 'package:imitate_yay/net/dao/circle_dao.dart';
import 'package:imitate_yay/util/date_util.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_pull_to_refresh.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CircleTabView extends StatefulWidget {
  // 分类ID
  final int cid;
  // 分类
  final CircleCategoryModel categoryModel;

  const CircleTabView({Key? key, required this.cid, required this.categoryModel}) : super(key: key);

  @override
  _CircleTabViewState createState() => _CircleTabViewState();
}

class _CircleTabViewState extends State<CircleTabView> with AutomaticKeepAliveClientMixin {
  CircleGroupModel? circleGroupModel;
  // 下拉刷新控制器
  final List<RefreshController> _refreshControllerList = [];
  int _categoryTabBarIndex = 0;

  // 初始化
  @override
  void initState() {
    super.initState();
    // 初始化下拉刷新控制器
    int cateCnt = widget.categoryModel.groupCategories?.length ?? 0 + 2;
    for (var i = 0; i < cateCnt; i++) {
      _refreshControllerList.add(RefreshController(initialRefresh: false));
    }
    _getGroupInfo();
  }

  // 缓存页面
  @override
  bool get wantKeepAlive => true;

  // 获取组信息
  _getGroupInfo({bool isLoadMore = false}) async {
    await CircleDao.getGroup(widget.cid).then((group) {
      setState(() {
        if (isLoadMore) {
          circleGroupModel?.groups?.addAll(group.groups ?? []);
        }
        circleGroupModel = group;
      });
    });
  }

  // 获取当前分类的索引
  int _getCategoryIndex() {
    for (final c in widget.categoryModel.groupCategories!) {
      if (widget.cid == -1) {
        return 0;
      }
      if (widget.cid == 0) {
        return 1;
      }
      if (c.id == widget.cid) {
        return widget.categoryModel.groupCategories!.indexOf(c);
      }
    }
    return 0;
  }

  // 根据分类ID获取分类名称
  String _findCategoryName(int categoryId) {
    for (final c in widget.categoryModel.groupCategories!) {
      if (c.id == categoryId) {
        return c.name ?? "";
      }
    }
    return "";
  }

  _onRefresh() {
    try {
      _getGroupInfo();
      _refreshControllerList[_categoryTabBarIndex].refreshCompleted();
    } catch (e) {
      _refreshControllerList[_categoryTabBarIndex].refreshFailed();
    }
  }

  _onLoading() {
    try {
      _getGroupInfo(isLoadMore: true);
      if (mounted) setState(() {});
      _refreshControllerList[_categoryTabBarIndex].loadComplete();
    } catch (e) {
      _refreshControllerList[_categoryTabBarIndex].loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("---view build---");
    _categoryTabBarIndex = _getCategoryIndex();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.setWidth(CommonConstant.mainLRPadding)),
      child: MyPullToRefresh(
        refreshController: _refreshControllerList[_categoryTabBarIndex],
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: circleGroupModel?.groups == null
            ? const SizedBox()
            : ListView.builder(
                itemCount: circleGroupModel?.groups?.length ?? 0,
                itemBuilder: (context, index) {
                  return _buildGroup(circleGroupModel!.groups![index]);
                }),
      ),
    );
  }

  /// 组
  _buildGroup(Groups group) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.grey,
          width: 0.1,
        )),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCover(group),
          Expanded(child: _buildBaseInfo(group)),
        ],
      ),
    );
  }

  /// 讨论组封面
  _buildCover(Groups group) {
    return SizedBox(
      height: ScreenUtil.setHeight(255),
      width: ScreenUtil.setWidth(255),
      child: Stack(
        children: [
          // 组封面图
          SizedBox(
            height: ScreenUtil.setHeight(240),
            width: ScreenUtil.setWidth(240),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(ScreenUtil.setHeight(50)),
              child: MyCacheNetImg(imgUrl: group.coverImageThumbnail ?? ""),
            ),
          ),
          // 创建者头像
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: ScreenUtil.setHeight(100),
              width: ScreenUtil.setWidth(100),
              child: ClipOval(
                child: MyCacheNetImg(imgUrl: group.owner?.profileIconThumbnail ?? ""),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 讨论组显示的基本信息
  _buildBaseInfo(Groups group) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 组名和更新时间
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 组名
              Expanded(
                flex: 3,
                child: MyText(
                  text: group.topic ?? "",
                  fontSize: 42,
                  overflow: TextOverflow.visible,
                ),
              ),
              // 更新时间
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topRight,
                  child: MyText(
                    text: DateUtil.format(group.updatedAt ?? 0),
                    fontSize: 38,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          // 简介
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: MyText(
              text: group.description ?? "",
              fontSize: 36,
              color: Colors.white60,
              maxLines: 4,
            ),
          ),

          // 分类
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orangeAccent,
                  ),
                ),
                // 分类名称
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: MyText(
                    text: _findCategoryName(group.groupCategoryId!),
                    fontSize: 30,
                    color: Colors.orangeAccent,
                  ),
                )
              ],
            ),
          ),

          // 人数，帖子数，查看数，更多
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildIconCount(Icons.person, group.groupsUsersCount.toString()),
                    const SizedBox(width: 5),
                    _buildIconCount(Icons.textsms, group.postsCount.toString()),
                    const SizedBox(width: 5),
                    _buildIconCount(Icons.remove_red_eye, group.viewsCount.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyIconBtn(
                      onPressed: _buildMoreBottomSheet,
                      icon: Icons.more_vert,
                      size: 70,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 左侧图标，右侧数量
  _buildIconCount(IconData icon, String count) {
    return Container(
      padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
      constraints: const BoxConstraints(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: Colors.white24,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white24,
            size: ScreenUtil.setFontSize(45),
          ),
          const SizedBox(width: 2),
          MyText(
            text: count,
            color: Colors.white24,
            fontSize: 30,
          ),
        ],
      ),
    );
  }

  // 点击更多按钮，弹出底部弹窗
  _buildMoreBottomSheet() {
    List<BottomSheetParam> params = [];
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.info, text: "组信息"));
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.warning, text: "举报"));
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MyBottomSheet(params: params);
        });
  }
}
