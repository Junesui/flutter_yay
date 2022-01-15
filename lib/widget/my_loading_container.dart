import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyLoadingContainer extends StatelessWidget {
  // 子组件
  final Widget child;
  // 加载状态
  final bool isLoading;

  const MyLoadingContainer({Key? key, required this.child, this.isLoading = false})
      : super(key: key);

  // 加载动画
  get _buildLoading {
    return const Center(
      child: SpinKitFadingCircle(
        color: Colors.orangeAccent,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? _buildLoading : child;
  }
}
