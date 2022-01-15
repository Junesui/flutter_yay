import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/constant/home_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

import 'home_tab_view.dart';

/// 首页
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: HomeConstant.tabbarTypes.length,
      vsync: this,
      initialIndex: HomeConstant.tabbarTypes.indexOf(HomeConstant.openType),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: CommonConstant.fromStateBar),
          child: Column(
            children: [
              // appBar
              _buildAppBar(),
              // appBar以下的内容
              _buildMainContent(),
            ],
          ),
        ),
      ),
    );
  }

  /// appBar
  _buildAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.setWidth(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          // logo
          MyText(
            text: "Logo",
            color: Colors.grey,
          ),

          // 搜索按钮
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  /// appBar以下的内容
  _buildMainContent() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            // tabBar
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 0.1,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.orangeAccent,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: TextStyle(fontSize: ScreenUtil.setFontSize(45)),
                tabs: HomeConstant.tabbarTypes.map((type) {
                  return SizedBox(
                    height: 35,
                    child: Tab(text: type == 0 ? "关注" : "公开"),
                  );
                }).toList(),
              ),
            ),
            // tabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: HomeConstant.tabbarTypes.map((type) {
                  return HomeTabView(type: type);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
