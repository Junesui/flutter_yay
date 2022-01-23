import 'package:flutter/material.dart';
import 'package:imitate_yay/util/screen_util.dart';
import 'package:lottie/lottie.dart';

/// 加载框
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
      child: SizedBox(
        width: SU.getScreenWidth() / 3,
        child: Lottie.asset('assets/animation/loading_button.json'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildLoading : child;
  }
}
