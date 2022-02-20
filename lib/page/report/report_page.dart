import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/home/home_content_model.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_appbar.dart';
import 'package:imitate_yay/widget/my_text.dart';

double _titleSize = 48;
double _contentSize = 40;

/// 举报页面
class ReportPage extends StatefulWidget {
  final Map arguments;
  // arguments 说明:
  // 投稿内容 PostContents content;

  const ReportPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(myTitle: "通報する"),
      body: _buildBody(),
    );
  }

  /// Body
  _buildBody() {
    PostContents _content = widget.arguments["content"];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReportContent(_content),
          _buildAddImg(),
          _buildSelectReason(),
        ],
      ),
    );
  }

  /// 举报的内容
  _buildReportContent(PostContents _content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        _buildTitle("通報する投稿"),
        _buildDivider(24),
        _buildPaddingContent(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头像
              CircleAvatar(
                radius: SU.setHeight(60),
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(_content.user?.profileIconThumbnail ?? ""),
              ),
              const SizedBox(width: 10),
              // 右侧昵称和内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 昵称
                    MyText(
                      text: _content.user?.nickname ?? "",
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                    ),
                    // 内容
                    MyText(
                      text: _content.text ?? "",
                      fontSize: 40,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 添加图片
  _buildAddImg() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCateDivider(),
        _buildTitle("写真を添付"),
        _buildDivider(24),
        _buildPaddingContent(
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildSelectImg(),
                const SizedBox(width: 10),
                _buildSelectImg(),
                const SizedBox(width: 10),
                _buildSelectImg(),
                const SizedBox(width: 10),
                _buildSelectImg(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 选择图片子项
  _buildSelectImg() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: SU.setHeight(200),
        width: SU.setHeight(200),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Icon(
            Icons.camera_alt_rounded,
            size: SU.setHeight(100),
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  /// 选择理由
  _buildSelectReason() {
    return Column(
      children: [
        _buildCateDivider(),
        _buildTitle("通報の理由を選んでください"),
        _buildDivider(10),

        /// TODO
      ],
    );
  }

  /// --- 以下为公共部分 ---
  /// 设定分类的分割线
  _buildCateDivider() {
    return const Divider(
      color: Colors.white24,
      thickness: 3,
      height: 42,
    );
  }

  /// 子项分割线
  _buildDivider(double height) {
    return Divider(
      color: Colors.white12,
      thickness: 1,
      height: height,
    );
  }

  /// 带边距的组件
  _buildPaddingContent(Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SU.setWidth(CommonConstant.mainLRPadding)),
      child: child,
    );
  }

  /// 分类标题
  _buildTitle(String text) {
    return _buildPaddingContent(MyText(text: text, fontSize: _titleSize));
  }
}
