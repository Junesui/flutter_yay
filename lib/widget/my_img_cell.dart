import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';

/// 九宫格图片展示组件
class MyImgCell extends StatelessWidget {
  // 图片URL列表
  final List<String> imgUrlList;

  const MyImgCell({Key? key, required this.imgUrlList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imgUrlList.length == 1) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: SU.setHeight(500),
        ),
        child: MyCacheNetImg(imgUrl: imgUrlList[0]),
      );
    }
    if (imgUrlList.length <= 3) {
      return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 3,
        crossAxisCount: imgUrlList.length,
        children: imgUrlList.map((url) {
          return MyCacheNetImg(imgUrl: url);
        }).toList(),
      );
    } else {
      return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        crossAxisCount: 3,
        children: imgUrlList.map((url) {
          return MyCacheNetImg(imgUrl: url);
        }).toList(),
      );
    }
  }
}
