import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 搜索页面
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonConstant.primaryBackGroundColor,
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.teal,
        child: Center(
          child: MyText(text: "SearchPage"),
        ),
      ),
    );
  }

  /// appBar
  _buildAppBar() {
    return AppBar(
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.grey,
      ),
      title: Text("検索"),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: SU.setWidth(CommonConstant.mainLRPadding)),
          child: Icon(
            Icons.qr_code,
            color: Colors.grey,
            size: SU.setFontSize(75),
          ),
        )
      ],
      backgroundColor: CommonConstant.primaryBackGroundColor,
    );
  }
}
