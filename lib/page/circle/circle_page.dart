import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/circle_constant.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/circle/circle_category_model.dart';
import 'package:imitate_yay/net/dao/circle_dao.dart';
import 'package:imitate_yay/page/circle/circle_tab_view.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_text.dart';

class CirclePage extends StatefulWidget {
  const CirclePage({Key? key}) : super(key: key);

  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  CircleCategoryModel? categoryModel;

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // 获取分类
  _getCategory() async {
    await CircleDao.getCategory().then((category) {
      setState(() {
        categoryModel = category;
        // 初始化 TabController
        _tabController = TabController(
          length: (categoryModel?.groupCategories?.length ?? 0) + CircleConstant.frontTabBarCnt,
          vsync: this,
          initialIndex: 0,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return categoryModel == null
        ? const SizedBox()
        : Scaffold(
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: CommonConstant.fromStateBar),
                child: Column(
                  children: [
                    _buildSearchBox(),
                    _buildMainContent(),
                  ],
                ),
              ),
            ),
          );
  }

  /// 搜索框
  _buildSearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(SU.setHeight(50)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[600] ?? Colors.grey,
            size: SU.setFontSize(65),
          ),
          const SizedBox(width: 6),
          MyText(
            text: "サークルを検索",
            color: Colors.grey[600] ?? Colors.grey,
            fontSize: SU.setFontSize(120),
          )
        ],
      ),
    );
  }

  /// 搜索框下面的内容
  _buildMainContent() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            // tabBar
            _buildTabBar(),
            // tabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // 参加中
                  CircleTabView(
                    cid: -1,
                    categoryModel: categoryModel!,
                  ),
                  // 全部
                  CircleTabView(
                    cid: 0,
                    categoryModel: categoryModel!,
                  ),
                  // 动态遍历
                  ...?categoryModel!.groupCategories?.map((category) {
                    return CircleTabView(
                      cid: category.id!,
                      categoryModel: categoryModel!,
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 分类 TabBar
  _buildTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.1,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        labelColor: Colors.orangeAccent,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(SU.setHeight(20)),
        ),
        labelPadding: EdgeInsets.only(top: SU.setHeight(20), bottom: SU.setHeight(10)),
        tabs: [
          // 固定分类 tabBar
          _buildTabBarItem(const Icon(Icons.home, color: Colors.grey), "参加中", 0),
          _buildTabBarItem(const Icon(Icons.linked_camera, color: Colors.grey), "全て", 1),

          // 动态获取的分类 tabBar
          ...?categoryModel!.groupCategories?.map((category) {
            int index = categoryModel!.groupCategories!.indexOf(category);
            return _buildTabBarItem(MyCacheNetImg(imgUrl: category.icon!), category.name!,
                index + CircleConstant.frontTabBarCnt);
          }).toList(),
        ],
      ),
    );
  }

  /// TabBar 子项
  _buildTabBarItem(Widget child, String name, int index) {
    return Container(
      height: SU.setHeight(200),
      width: SU.setWidth(180),
      margin: EdgeInsets.symmetric(horizontal: SU.setWidth(24)),
      child: Column(
        children: [
          // 图标
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SU.setHeight(100)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          // 名称
          MyText(
            text: name,
            color: null,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
