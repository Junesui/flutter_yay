import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/page/search/qr/qr_my_view.dart';
import 'package:imitate_yay/page/search/qr/qr_scan_view.dart';
import 'package:imitate_yay/widget/my_appbar.dart';

class QRPage extends StatefulWidget {
  const QRPage({Key? key}) : super(key: key);

  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> with SingleTickerProviderStateMixin {
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
      appBar: MyAppBar(myTitle: "QRコード"),
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
