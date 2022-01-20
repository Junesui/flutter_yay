import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLoadingContainer extends StatelessWidget {
  // 子组件
  final Widget child;
  // 加载状态
  final bool isLoading;

  const MyLoadingContainer({Key? key, required this.child, this.isLoading = false})
      : super(key: key);

  // 加载动画
  get _buildLoading {
    return Center(
      child: Lottie.asset('assets/animation/loading_button.json'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildLoading : child;
  }
}
