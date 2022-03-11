import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:imitate_yay/net/http/my_exception.dart';
import 'package:imitate_yay/util/toast_util.dart';

// 错误处理拦截器
class MyErrorInterceptor extends Interceptor {
  // 是否有网络连接
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // 网络连接错误
    if (err.error is SocketException) {
      err.error = MyDioSocketException(
        err.message,
        osError: err.error?.osError,
        address: err.error?.address,
        port: err.error?.port,
      );
    }
    // 是否已经连接了网络，不判断是否没网
    if (err.type == DioErrorType.other) {
      bool isConnectNetWork = await isConnected();
      if (err.error is MyDioSocketException && !isConnectNetWork) {
        err.error.message = "网络连接不可用，请检查网络";
      }
    }
    // error统一处理
    MyException appException = MyException.create(err);

    // 错误提示
    ToastUtil.show(msg: appException.getMessage());
    //err.error = appException;
    //return super.onError(err, handler);
  }
}

// 自定义一个 socket 类，因为 SocketException 的 message 是只读
class MyDioSocketException implements SocketException {
  @override
  String message;

  @override
  final InternetAddress? address;

  @override
  final OSError? osError;

  @override
  final int? port;

  MyDioSocketException(
    this.message, {
    this.osError,
    this.address,
    this.port,
  });
}
