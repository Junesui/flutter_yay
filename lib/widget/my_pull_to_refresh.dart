import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 下拉刷新-下拉加载
class MyPullToRefresh extends StatelessWidget {
  final RefreshController refreshController;
  final Function() onRefresh;
  final Function() onLoading;
  final Widget child;

  const MyPullToRefresh({
    Key? key,
    required this.refreshController,
    required this.onRefresh,
    required this.onLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: true,
      enablePullDown: true,
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}
