import 'package:flutter/material.dart';
import 'package:imitate_yay/page/common/photo_view_page.dart';

/// (点击图片)查看大图页面
class PhotoViewUtil {
  static void view(BuildContext context, List<String> imgUrls, int index) {
    Navigator.of(context).push(FadeRoute(
      page: PhotoViewPage(
        imgUrls: imgUrls,
        index: index,
      ),
    ));
  }
}

/// 自定义查看大图的转场动画
class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Offset beginOffset = const Offset(-1.0, 0.0);
            Offset endOffset = const Offset(0.0, 0.0);
            return SlideTransition(
              position: Tween<Offset>(
                begin: beginOffset,
                end: endOffset,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutQuint,
                ),
              ),
              child: child,
            );
          },
        );
}
