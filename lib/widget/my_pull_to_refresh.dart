import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 下拉刷新-下拉加载
class MyPullToRefresh extends StatelessWidget {
  final Widget child;
  final RefreshController refreshController;
  final Function() onRefresh;
  final Function() onLoading;

  const MyPullToRefresh(
      {Key? key,
      required this.child,
      required this.refreshController,
      required this.onRefresh,
      required this.onLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: child);
  }
}
