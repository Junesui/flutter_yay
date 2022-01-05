import 'package:flutter/material.dart';
import 'package:imitate_yay/page/tab/chat_tab_page.dart';
import 'package:imitate_yay/page/tab/circle_tab_page.dart';
import 'package:imitate_yay/page/tab/home_tab_page.dart';
import 'package:imitate_yay/page/tab/message_tab_page.dart';
import 'package:imitate_yay/page/tab/my_tab_page.dart';
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
    MyTabPage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
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
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: ScreenUtil.setFontSize(70),
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
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
      icon: Icon(icon),
      label: "",
    );
  }
}
