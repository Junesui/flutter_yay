import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCacheNetImg extends StatelessWidget {
  final String imgUrl;

  const MyCacheNetImg({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: BoxFit.cover,
      // 占位符
      placeholder: (context, url) => _buildPlaceholder(),
      // 错误时候占位符
      errorWidget: (context, url, error) => _buildPlaceholder(),
    );
  }

  // 占位符
  SizedBox _buildPlaceholder() {
    return SizedBox(
      child: Image.asset(
        "images/avatar.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
