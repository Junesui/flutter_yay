import 'package:flutter/material.dart';
import 'package:imitate_yay/page/home/follow_tab.dart';
import 'package:imitate_yay/page/home/home_tab_view.dart';
import 'package:imitate_yay/page/home/public_tab.dart';
import 'package:imitate_yay/util/screen_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<int> types = [1, 2];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            EdgeInsets.only(top: ScreenUtil.getStateBarHeight(context) + 3),
        child: Column(
          children: [
            // 顶部
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil.setWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // logo
                  Text(
                    "Logo",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // 搜索按钮
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            _buildTabBar(),
            _buildTabBarView(),
          ],
        ),
      ),
    );
  }

  /// TabBar
  _buildTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: ScreenUtil.getScreenWidth(),
      height: 30,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.1,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: Colors.orangeAccent,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(fontSize: ScreenUtil.setFontSize(45)),
        tabs: types.map((type) {
          return Tab(text: type == 1 ? "关 注" : "公 开");
        }).toList(),
      ),
    );
  }

  /// TabBarView
  _buildTabBarView() {
    return Expanded(
      flex: 1,
      child: TabBarView(
        controller: _tabController,
        children: types.map((type) => HomeTabView(type: type)).toList(),
      ),
    );
  }
}
