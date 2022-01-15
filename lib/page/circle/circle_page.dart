import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/circle_constant.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/circle/circle_category_model.dart';
import 'package:imitate_yay/net/dao/circle_dao.dart';
import 'package:imitate_yay/page/circle/circle_tab_view.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_loading_container.dart';
import 'package:imitate_yay/widget/my_text.dart';

class CirclePage extends StatefulWidget {
  const CirclePage({Key? key}) : super(key: key);

  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;
  final PageController _pageController = PageController(initialPage: 0);
  // 当前的 pageIndex
  int _pageIndex = 0;
  CircleCategoryModel? categoryModel;

  // 数据加载状态
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  // 获取分类
  _getCategory() async {
    await CircleDao.getCategory().then((category) {
      setState(() {
        categoryModel = category;
        // 初始化 TabController
        _initTabController();

        _isLoading = false;
      });
    });
  }

  // 初始化 TabController
  _initTabController() {
    _tabController = TabController(
      length: (categoryModel?.groupCategories?.length ?? 0) + CircleConstant.frontTabBarCnt,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MyLoadingContainer(
      isLoading: _isLoading,
      child: categoryModel == null
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
            ),
    );
  }

  /// 搜索框
  _buildSearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil.setWidth(CommonConstant.mainLRPadding)),
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(ScreenUtil.setHeight(50)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey[600] ?? Colors.grey,
            size: ScreenUtil.setFontSize(65),
          ),
          const SizedBox(width: 6),
          MyText(
            text: "サークルを検索",
            color: Colors.grey[600] ?? Colors.grey,
            fontSize: ScreenUtil.setFontSize(120),
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
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(index);
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount:
                    (categoryModel?.groupCategories?.length ?? 0) + CircleConstant.frontTabBarCnt,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return CircleTabView(cid: -1);
                  }
                  if (index == 1) {
                    return CircleTabView(cid: 0);
                  }
                  return CircleTabView(
                      cid: categoryModel!
                          .groupCategories![index - CircleConstant.frontTabBarCnt]!.id!);
                },
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
        indicator: const BoxDecoration(
          color: Colors.transparent,
        ),
        labelPadding: EdgeInsets.zero,
        tabs: [
          // 固定分类 tabBar
          _buildTabBarItem(const Icon(Icons.home), "参加中", 30, 45, 0),
          _buildTabBarItem(const Icon(Icons.linked_camera), "全て", 0, 45, 1),

          // 动态获取的分类 tabBar
          ...?categoryModel!.groupCategories?.map((category) {
            int index = categoryModel!.groupCategories!.indexOf(category);
            return _buildTabBarItem(Image(image: NetworkImage(category.icon!)), category.name!, 0,
                45, index + CircleConstant.frontTabBarCnt);
          }).toList(),
        ],
      ),
    );
  }

  /// TabBar 子项
  _buildTabBarItem(Widget child, String name, double left, double right, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _pageIndex = index;
        });
        _pageController.jumpToPage(index);
      },
      child: Container(
        height: ScreenUtil.setHeight(200),
        width: ScreenUtil.setWidth(160),
        margin: EdgeInsets.only(
          left: ScreenUtil.setWidth(left),
          right: ScreenUtil.setWidth(right),
          bottom: 2,
        ),
        child: Column(
          children: [
            // 图标
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ScreenUtil.setHeight(100)),
                      border: Border.all(
                        color: index == _pageIndex
                            ? Colors.orangeAccent
                            : Colors.grey[800] ?? Colors.grey,
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
              color: Colors.grey,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
