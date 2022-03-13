import 'package:dio/dio.dart';

/// 请求拦截器
class MyRequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.copyWith(
    //   headers: {
    //     // 'Authorization': 'xxx',
    //   },
    // );

    return super.onRequest(options, handler);
  }
}
