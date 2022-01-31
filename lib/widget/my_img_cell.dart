import 'package:flutter/material.dart';
import 'package:imitate_yay/router/router_name.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:imitate_yay/widget/my_cache_net_img.dart';

/// 九宫格图片展示组件
class MyImgCell extends StatelessWidget {
  // 图片URL列表
  final List<String> imgUrls;

  const MyImgCell({Key? key, required this.imgUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imgUrls.length == 1) {
      return Container(
        constraints: BoxConstraints(
          maxHeight: SU.setHeight(500),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              RouterName.photoView,
              arguments: {"imgUrls": imgUrls, "index": 0},
            );
          },
          child: MyCacheNetImg(imgUrl: imgUrls[0]),
        ),
      );
    }
    if (imgUrls.length <= 3) {
      return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 3,
        crossAxisCount: imgUrls.length,
        children: imgUrls.map((url) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouterName.photoView,
                arguments: {"imgUrls": imgUrls, "index": imgUrls.indexOf(url)},
              );
            },
            child: MyCacheNetImg(imgUrl: url),
          );
        }).toList(),
      );
    } else {
      return GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        crossAxisCount: 3,
        children: imgUrls.map((url) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                RouterName.photoView,
                arguments: {"imgUrls": imgUrls, "index": imgUrls.indexOf(url)},
              );
            },
            child: MyCacheNetImg(imgUrl: url),
          );
        }).toList(),
      );
    }
  }
}
