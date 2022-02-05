import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/page/search/qr/qr_my_view.dart';
import 'package:imitate_yay/page/search/qr/qr_scan_view.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';

class SearchQRPage extends StatefulWidget {
  const SearchQRPage({Key? key}) : super(key: key);

  @override
  _SearchQRPageState createState() => _SearchQRPageState();
}

class _SearchQRPageState extends State<SearchQRPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                QRMyView(),
                QRScanView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// AppBar
  _buildAppBar() {
    return AppBar(
      backgroundColor: CommonConstant.primaryBackGroundColor,
      leading: MyIconBtn(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icons.arrow_back_ios,
      ),
      title: MyText(
        text: "QRコード",
        fontSize: SU.setFontSize(150),
      ),
    );
  }

  /// TabBar
  _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: CommonConstant.primaryColor,
      indicatorColor: CommonConstant.primaryColor,
      indicatorWeight: 3,
      unselectedLabelColor: Colors.white70,
      tabs: const [
        Tab(
          text: "自分のQRコード",
        ),
        Tab(
          text: "QRコードを読み取る",
        ),
      ],
    );
  }
}
