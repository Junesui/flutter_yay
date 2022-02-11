import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:imitate_yay/widget/my_upcount.dart';
import 'package:lottie/lottie.dart';

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
              Expanded(child: _buildUserAvatars()),
              const MyText(text: "他の参加者を待っています...", fontSize: 50),
              const SizedBox(height: 6),
              _buildSmallPlayIcon(),
              const SizedBox(height: 6),
              _buildBigFuncionIcon(),
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
        GestureDetector(
          onTap: () {},
          child: Chip(
            backgroundColor: Colors.grey[800],
            shape: const CircleBorder(),
            label: Icon(
              Icons.expand_more,
              color: Colors.white70,
              size: SU.setFontSize(65),
            ),
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
        suffix: const MyText(
          text: "・by suiz",
          fontSize: 32,
          color: Colors.grey,
        ),
      ),
    );
  }

  /// 中间用户头像区域
  _buildUserAvatars() {
    String testAvatarUrl =
        "https://images.pexels.com/photos/4386364/pexels-photo-4386364.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset("assets/animation/waitting_ripple.json"),
        SizedBox(
          height: SU.setHeight(300),
          width: SU.setHeight(300),
          child: Stack(
            children: [
              // 头像
              CircleAvatar(
                radius: SU.setHeight(150),
                backgroundColor: Colors.transparent,
                backgroundImage: MyCacheNetImg.provider(testAvatarUrl),
              ),
              // 房主图标
              Positioned(
                left: SU.setWidth(20),
                child: CircleAvatar(
                  radius: SU.setHeight(32),
                  backgroundColor: CommonConstant.primaryColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: SU.setFontSize(46),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 四个小按钮 【游戏，表情，说话，设置】
  _buildSmallPlayIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSmallPlayIconItem(Icons.sports_esports),
        _buildSmallPlayIconItem(Icons.tag_faces),
        _buildSmallPlayIconItem(Icons.record_voice_over),
        _buildSmallPlayIconItem(Icons.settings),
      ],
    );
  }

  /// 小按钮子项
  _buildSmallPlayIconItem(IconData icon) {
    return Chip(
      backgroundColor: Colors.grey[800],
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(5),
      label: Icon(icon, size: SU.setFontSize(62), color: Colors.white70),
    );
  }

  /// 最底部四个大按钮 【音乐，扩声器，麦克风，退出】
  _buildBigFuncionIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SU.setHeight(36)),
        color: Colors.grey[800],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBigFuncionIconItem(Icons.music_note, Colors.white70, "BGM", true, () {}),
          _buildVerticalDiveder(),
          _buildBigFuncionIconItem(Icons.volume_up, Colors.white70, "スピーカー", true, () {}),
          _buildVerticalDiveder(),
          _buildBigFuncionIconItem(Icons.mic, Colors.white70, "マイク", true, () {}),
          _buildVerticalDiveder(),
          _buildBigFuncionIconItem(Icons.logout, Colors.red, "退出", false, () {
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }

  /// 最底部四个大按钮子项
  _buildBigFuncionIconItem(
      IconData icon, Color color, String text, bool isHasRightLine, VoidCallback ontap) {
    return Row(
      children: [
        Column(
          children: [
            MyIconBtn(
              onPressed: ontap,
              icon: icon,
              size: 70,
              color: color,
            ),
            const SizedBox(height: 3),
            MyText(
              text: text,
              color: color,
              fontSize: 30,
            ),
          ],
        ),
      ],
    );
  }

  /// 垂直分割线
  _buildVerticalDiveder() {
    return SizedBox(
      height: SU.setHeight(100),
      child: const VerticalDivider(
        color: Colors.white12,
      ),
    );
  }
}
