import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/page/post/post_img_cell.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class MessageTabPage extends StatefulWidget {
  const MessageTabPage({Key? key}) : super(key: key);

  @override
  _MessageTabPageState createState() => _MessageTabPageState();
}

class _MessageTabPageState extends State<MessageTabPage> {
  List<AssetEntity> imgs = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: _pickImg,
            child: const Icon(
              Icons.add,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
        imgs == null ? const SizedBox() : PostImgCell(imgs: imgs),
      ],
    );
  }

  _pickImg() async {
    List<AssetEntity>? entities = await AssetPicker.pickAssets(
      context,
      themeColor: CommonConstant.primaryColor,
      useRootNavigator: false,
    );
    if (entities?.isNotEmpty ?? false) {
      setState(() {
        imgs.addAll(entities!);
      });
    }
  }
}
