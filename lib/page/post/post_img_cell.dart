import 'package:flutter/material.dart';
import 'package:imitate_yay/constant/common_constant.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 九宫格图片展示组件-发布图片
class PostImgCell extends StatelessWidget {
  // 图片
  final List<AssetEntity>? imgs;

  const PostImgCell({Key? key, required this.imgs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = SU.setHeight(360);

    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
        horizontal: SU.setWidth(CommonConstant.mainLRPadding),
        vertical: 20,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imgs?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 3),
            child: AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                height: height,
                child: Image(
                  image: AssetEntityImageProvider(
                    imgs![index],
                    isOriginal: false,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
