import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:imitate_yay/widget/my_upcount.dart';

/// 通话页面
class CallingPage extends StatefulWidget {
  const CallingPage({Key? key}) : super(key: key);

  @override
  _CallingPageState createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  // 输入框焦点标识
  final FocusNode _inputFocusNode = FocusNode();
  //输入框控制器
  final TextEditingController _editingController = TextEditingController();

  // 输入框后面的图标是否是拷贝
  bool _isCopy = true;

  @override
  void initState() {
    super.initState();
    // 监听焦点变化
    _inputFocusNode.addListener(() {
      if (_inputFocusNode.hasFocus) {
        setState(() {
          _isCopy = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SU.setWidth(CommonConstant.mainLRPadding)),
          child: Column(
            children: [
              _buildAppBar(),
              const SizedBox(height: 6),
              _buildInput(),
            ],
          ),
        ),
      ),
    );
  }

  /// AppBar
  _buildAppBar() {
    return Row(
      children: [
        // 图标
        Icon(
          Icons.group,
          color: Colors.white70,
          size: SU.setFontSize(70),
        ),
        const SizedBox(width: 15),
        // 通话时长
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MyText(
              text: "通話中",
              fontSize: 40,
              color: Colors.white70,
            ),
            MyUpcount(),
          ],
        ),
        const Spacer(),
        // 招待ボタン
        Chip(
          backgroundColor: Colors.grey[800],
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
          label: Row(
            children: [
              Icon(
                Icons.person_add_alt,
                color: Colors.white70,
                size: SU.setFontSize(52),
              ),
              const SizedBox(width: 3),
              const MyText(
                text: "招待",
                fontSize: 35,
                color: Colors.white70,
              ),
            ],
          ),
        ),
        const SizedBox(width: 3),
        // 最小化按钮
        Chip(
          backgroundColor: Colors.grey[800],
          shape: const CircleBorder(),
          label: Icon(
            Icons.expand_more,
            color: Colors.white70,
            size: SU.setFontSize(65),
          ),
        ),
      ],
    );
  }

  /// 输入框
  _buildInput() {
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(SU.setHeight(80)),
      borderSide: BorderSide.none,
    );

    return TextFormField(
      controller: _editingController,
      cursorColor: CommonConstant.primaryColor,
      textAlignVertical: TextAlignVertical.center,
      maxLines: 2,
      minLines: 1,
      style: TextStyle(
        color: Colors.white,
        fontSize: SU.setFontSize(40),
      ),
      focusNode: _inputFocusNode,
      decoration: InputDecoration(
        hintText: "ゲームのIDやパスワードを共有",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: SU.setFontSize(36),
        ),
        filled: true,
        fillColor: Colors.black54,
        focusedBorder: _outlineInputBorder,
        isCollapsed: true,
        contentPadding: EdgeInsets.fromLTRB(
          SU.setWidth(60),
          SU.setHeight(36),
          SU.setWidth(10),
          SU.setHeight(36),
        ),
        border: _outlineInputBorder,
        suffixIcon: GestureDetector(
          onTap: () {
            String text = _editingController.value.text;
            if (_isCopy && text.isNotEmpty) {
              Clipboard.setData(ClipboardData(text: text));
            } else {
              print("--> 更新数据");
              setState(() {
                _isCopy = true;
                _inputFocusNode.unfocus();
                text = text + "";
              });
            }
          },
          child: Icon(
            _isCopy ? Icons.copy : Icons.refresh,
            color: Colors.white70,
            size: SU.setFontSize(62),
          ),
        ),
      ),
    );
  }
}
