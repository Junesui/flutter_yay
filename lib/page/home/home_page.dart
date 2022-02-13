import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/constant/home_constant.dart';
import 'package:imitate_yay/router/router_name.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
      floatingActionButton: _buildPostBtn(),
    );
  }

  /// appBar
  _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // logo
          const MyText(
            text: "Logo",
            color: CommonConstant.primaryColor,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),

          // 搜索按钮
          MyIconBtn(
            onPressed: () {
              Navigator.of(context).pushNamed(RouterName.search);
            },
            icon: Icons.search,
            size: 85,
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
            _buildTabBar(),
            const Divider(color: Colors.white24, height: 0),
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

  /// TabBar
  _buildTabBar() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      indicatorColor: CommonConstant.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: HomeConstant.tabbarTypes.map((type) {
        return SizedBox(
          height: 35,
          child: Tab(
            child: type == 0
                ? const MyText(
                    text: "关注",
                    color: Colors.grey,
                    fontSize: 50,
                  )
                : const MyText(
                    text: "公开",
                    color: Colors.grey,
                    fontSize: 50,
                  ),
          ),
        );
      }).toList(),
    );
  }

  /// 发布按钮
  _buildPostBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouterName.post);
      },
      child: CircleAvatar(
        radius: SU.setHeight(80),
        backgroundColor: CommonConstant.primaryColor,
        child: Icon(FontAwesome.edit, color: Colors.white, size: SU.setFontSize(62)),
      ),
    );
  }
}
