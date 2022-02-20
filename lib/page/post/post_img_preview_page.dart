import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 图片预览页面
class PostImgPreviewPage extends StatefulWidget {
  final Map arguments;
  // arguments 说明:
  // 图片列表 - List<AssetEntity>? imgs;
  // 图片的index - int index;
  // 是否隐藏关闭按钮 - bool isHiddenCloseBtn;[默认 true]

  const PostImgPreviewPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _PostImgPreviewPageState createState() => _PostImgPreviewPageState();
}

class _PostImgPreviewPageState extends State<PostImgPreviewPage> {
  // 控制器
  PageController _pageController = PageController(initialPage: 0);
  // 当前页Index
  int _currentIndex = 0;
  // 选中图片下面的原点指示器颜色
  static const Color _selColor = Colors.white;
  // 其他图片的原点指示器颜色
  static const Color _otherColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.arguments["index"]);
    _currentIndex = widget.arguments["index"];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildImg(),
          _buildCloseBtn(),
          _buildDotIndicator(),
        ],
      ),
    );
  }

  /// 图片
  _buildImg() {
    return Positioned(
      left: 0,
      top: 0,
      right: 0,
      bottom: 0,
      child: Container(
        color: Colors.black,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          onLongPress: () {},
          child: PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: AssetEntityImageProvider(widget.arguments["imgs"][index]),
                initialScale: PhotoViewComputedScale.contained,
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            itemCount: widget.arguments["imgs"].length,
            loadingBuilder: (context, event) => const Center(
              child: SizedBox(
                width: 28.0,
                height: 28.0,
                child: CircularProgressIndicator(color: Colors.grey),
              ),
            ),
            backgroundDecoration: null,
            pageController: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  /// 关闭按钮
  _buildCloseBtn() {
    return Positioned(
      top: 20,
      right: 20,
      height: 20,
      child: Offstage(
        offstage: widget.arguments["isHiddenCloseBtn"] ?? true,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// 底部圆点指示器
  _buildDotIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: widget.arguments["imgs"].length == 1 ? 0 : 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.arguments["imgs"].length,
            (index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: CircleAvatar(
                  radius: 3,
                  backgroundColor: index == _currentIndex ? _selColor : _otherColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
