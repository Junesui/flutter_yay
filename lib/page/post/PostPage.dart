import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_appbar.dart';

/// 发布页面
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(myTitle: "投稿"),
      body: _buildBody(),
    );
  }

  /// Body
  _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SU.setWidth(CommonConstant.mainLRPadding),
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  /// 输入内容区域
  _buildInputArea() {
    return TextFormField(
      controller: _editingController,
      cursorColor: CommonConstant.primaryColor,
      textAlignVertical: TextAlignVertical.center,
      maxLines: 999,
      minLines: 1,
      maxLength: 200,
      autofocus: true,
      style: TextStyle(
        color: Colors.white,
        fontSize: SU.setFontSize(48),
      ),
      decoration: InputDecoration(
        hintText: "今日あったこと、話したいこと、興味のあること、なんでも気軽につぶやいていよう！",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: SU.setFontSize(42),
        ),
        isCollapsed: true,
        border: InputBorder.none,
        counterStyle: TextStyle(
          color: Colors.grey,
          fontSize: SU.setFontSize(42),
          height: 2,
        ),
      ),
    );
  }
}
