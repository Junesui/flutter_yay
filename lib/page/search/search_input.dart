import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';

/// 搜索输入弹出框
class SearchInput extends StatefulWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  // 用户名输入框控制器
  final TextEditingController _usernameController = TextEditingController();
  // 个人简介输入框控制器
  final TextEditingController _biographyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _biographyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SU.getScreenWidth() * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: CommonConstant.primaryBackGroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: _buildForm(),
      ),
    );
  }

  /// 输入表单
  _buildForm() {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 标题
            _buildTitle(),
            _buildDivider(),
            // 用户名
            _buildInput(Icons.person, "名前", _usernameController),
            _buildDivider(),
            // 个人简介
            _buildInput(Icons.event_note, "自己紹介", _biographyController),
            _buildDivider(),
            // 相同省份
            _buildSelect(Icons.location_on, "同じ都道府県のユーザー"),
            _buildDivider(),
            // 相同年代
            _buildSelect(Icons.group, "同年代のユーザー"),
            _buildDivider(),
            // 屏蔽最近拉黑的人
            _buildSelect(Icons.block, "最近ゴミ虫になった人を除く"),
            _buildDivider(),
            // 搜索按钮
            _buildSearchBtn(),
          ],
        ),
      ),
    );
  }

  /// 分割线
  _buildDivider() {
    return const Divider(color: Colors.white24, height: 0);
  }

  /// 标题
  _buildTitle() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 15),
        child: MyText(
          text: "ユーザーを探す",
          fontSize: SU.setFontSize(120),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 输入框
  _buildInput(IconData icon, String text, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: SU.setHeight(130),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.end,
          cursorWidth: 3,
          autofocus: true,
          cursorColor: CommonConstant.primaryColor,
          cursorRadius: const Radius.circular(10),
          style: TextStyle(
            color: Colors.white,
            fontSize: SU.setFontSize(40),
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "未設定",
            hintStyle: TextStyle(
              color: Colors.white38,
              fontSize: SU.setFontSize(40),
            ),
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: SU.setFontSize(60),
                ),
                const SizedBox(width: 5),
                MyText(
                  text: text,
                  color: Colors.grey,
                  fontSize: 38,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 选择框
  _buildSelect(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: SU.setHeight(130),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.grey,
                  size: SU.setFontSize(60),
                ),
                const SizedBox(width: 5),
                MyText(
                  text: text,
                  color: Colors.grey,
                  fontSize: 38,
                ),
              ],
            ),
            SizedBox(
              width: SU.setWidth(120),
              child: Switch(
                value: false,
                onChanged: (select) {},
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.white24,
                activeColor: CommonConstant.primaryColor,
                activeTrackColor: CommonConstant.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 搜索按钮
  _buildSearchBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {},
        child: MyText(
          text: "検索",
          fontSize: SU.setFontSize(120),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CommonConstant.primaryColor),
          padding:
              MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SU.setHeight(100)),
            ),
          ),
        ),
      ),
    );
  }
}
