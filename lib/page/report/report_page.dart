import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/model/home/home_content_model.dart';
import 'package:imitate_yay/util/pick_util.dart';
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
  // 举报理由
  String _reportReason = "举报理由0";
  final TextEditingController _inputController = TextEditingController();

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
          _buildReportDesc(),
          _buildSendBtn(),
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
      onTap: () {
        // TODO
        PickUtil.pick(context, [], maxAssets: 4);
      },
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCateDivider(),
        _buildTitle("通報の理由を選んでください"),
        _buildDivider(24),
        _buildReportReasonPopup(),
      ],
    );
  }

  /// 举报理由弹框
  _buildReportReasonPopup() {
    return PopupMenuButton(
      color: Colors.black,
      child: _buildPaddingContent(
        Row(
          children: [
            Expanded(
              child: MyText(
                text: _reportReason,
                fontSize: 46,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
      onSelected: (v) {
        setState(() {
          _reportReason = (v as Map).values.first;
        });
      },
      tooltip: "",
      itemBuilder: (context) {
        return const [
          PopupMenuItem(child: MyText(text: "举报理由0", fontSize: 46), value: {0: "举报理由0"}),
          PopupMenuItem(child: MyText(text: "举报理由1", fontSize: 46), value: {1: "举报理由1"}),
          PopupMenuItem(child: MyText(text: "举报理由2", fontSize: 46), value: {2: "举报理由2"}),
          PopupMenuItem(child: MyText(text: "举报理由3", fontSize: 46), value: {3: "举报理由3"}),
        ];
      },
    );
  }

  /// 举报详细描述
  _buildReportDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCateDivider(),
        _buildTitle("通報の詳細"),
        const SizedBox(height: 8),
        _buildDescInput(),
      ],
    );
  }

  /// 输入内容区域
  _buildDescInput() {
    return _buildPaddingContent(
      TextFormField(
        controller: _inputController,
        cursorColor: CommonConstant.primaryColor,
        textAlignVertical: TextAlignVertical.center,
        maxLines: 999,
        minLines: 1,
        maxLength: 200,
        style: TextStyle(
          color: Colors.white,
          fontSize: SU.setFontSize(48),
        ),
        decoration: InputDecoration(
          hintText: "内容はできるだけ詳細に入力してください。\n 対応できない場合もございます。",
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
      ),
    );
  }

  /// 发送按钮
  _buildSendBtn() {
    return Center(
      child: Column(
        children: [
          _buildDivider(24),
          // 按钮
          ElevatedButton(
            onPressed: () {},
            child: const MyText(
              text: "发送",
              fontSize: 46,
            ),
            style: ElevatedButton.styleFrom(
              primary: CommonConstant.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(horizontal: SU.setWidth(80)),
            ),
          ),
        ],
      ),
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
