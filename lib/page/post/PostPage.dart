import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_appbar.dart';
import 'package:imitate_yay/widget/my_bottom_sheet.dart';
import 'package:imitate_yay/widget/my_icon_btn.dart';
import 'package:imitate_yay/widget/my_text.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 发布页面
class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _editingController = TextEditingController();

  // 投稿类型 0:文字，1:语音，2:视频
  int _postType = 0;

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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SU.setWidth(CommonConstant.mainLRPadding),
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildInputArea()),
          _buildCallAndVideoBtn(),
          _buildBottomRow(),
        ],
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

  /// 通话和视频按钮
  _buildCallAndVideoBtn() {
    return Row(
      children: [
        // 通话
        GestureDetector(
          onTap: () {
            setState(() {
              if (_postType == 1) {
                _postType = 0;
              } else {
                _postType = 1;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _postType == 1 ? Colors.green : CommonConstant.primaryBackGroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 3, offset: Offset(0, 2))
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.call,
                  color: _postType == 1 ? Colors.white : Colors.green,
                  size: SU.setFontSize(60),
                ),
                const SizedBox(width: 5),
                MyText(
                  text: "だれ通",
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: _postType == 1 ? Colors.white : Colors.green,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 2),
        // 视频
        GestureDetector(
          onTap: () {
            setState(() {
              if (_postType == 2) {
                _postType = 0;
              } else {
                _postType = 2;
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _postType == 2 ? Colors.cyanAccent : CommonConstant.primaryBackGroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 3, offset: Offset(0, 2))
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.video_call,
                  color: _postType == 2 ? Colors.white : Colors.cyanAccent,
                  size: SU.setFontSize(60),
                ),
                const SizedBox(width: 5),
                MyText(
                  text: "だれビ",
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: _postType == 2 ? Colors.white : Colors.cyanAccent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 最底部行。选择图片，发送按钮
  _buildBottomRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 选择图片
          MyIconBtn(
            onPressed: _buildMoreBottomSheet,
            icon: Icons.image,
            size: 90,
            color: Colors.grey,
          ),
          // 发送按钮
          ElevatedButton(
            onPressed: () {},
            child: const MyText(
              text: "送信",
              fontSize: 42,
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.brown,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.symmetric(horizontal: 25),
            ),
          ),
        ],
      ),
    );
  }

  // 拍照，从相册选择
  _buildMoreBottomSheet() {
    List<BottomSheetParam> params = [];
    params.add(BottomSheetParam(onTap: () {}, icon: Icons.photo_camera, text: "拍摄"));
    params.add(BottomSheetParam(onTap: _pickImg, icon: Icons.collections, text: "从相册选择"));
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MyBottomSheet(params: params);
        });
  }

  /// 从相册选择
  _pickImg() async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(context);
  }
}
