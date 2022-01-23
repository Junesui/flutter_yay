import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/page/tab/chat_tab_page.dart';
import 'package:imitate_yay/page/tab/circle_tab_page.dart';
import 'package:imitate_yay/page/tab/home_tab_page.dart';
import 'package:imitate_yay/page/tab/message_tab_page.dart';
import 'package:imitate_yay/page/tab/profile_tab_page.dart';
import 'package:imitate_yay/util/event_bus_util.dart';
import 'package:imitate_yay/util/screen_util.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pageList = [
    HomeTabPage(),
    CircleTabPage(),
    ChatTabPage(),
    MessageTabPage(),
    ProfileTabPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    //_pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pageList,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// 底部导航栏
  Container _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.1,
            color: Colors.white,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: CommonConstant.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: SU.setFontSize(70),
        onTap: (index) {
          //  如果当前页是首页，则发送首页回到顶部事件
          if (_currentIndex == index) {
            EventBusUtil.fire<HomeBackToTopEvent>(HomeBackToTopEvent());
          }
          _pageController.jumpToPage(index);
        },
        items: [
          _buildBottomItem(Icons.home),
          _buildBottomItem(Icons.device_hub),
          _buildBottomItem(Icons.textsms),
          _buildBottomItem(Icons.notifications),
          _buildBottomItem(Icons.person),
        ],
      ),
    );
  }

  /// 底部导航栏的item
  _buildBottomItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: GestureDetector(child: Icon(icon)),
      label: "",
      tooltip: "",
    );
  }
}
