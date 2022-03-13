import 'package:dio/dio.dart';

/// 网络请求和网络响应 的异常
class HttpException implements Exception {
  // 状态码
  final int _code;
  // 异常消息
  final String _message;

  HttpException(
    this._code,
    this._message,
  );

  @override
  String toString() {
    return "$_code $_message";
  }

  String getMessage() {
    return _message;
  }

  factory HttpException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        {
          return HttpException(-1, "连接超时");
        }
      case DioErrorType.sendTimeout:
        {
          return HttpException(-1, "请求超时");
        }
      case DioErrorType.receiveTimeout:
        {
          return HttpException(-1, "响应超时");
        }
      case DioErrorType.cancel:
        {
          return HttpException(-1, "请求取消");
        }
      case DioErrorType.response:
        {
          try {
            int errCode = error.response!.statusCode!;
            if (errCode.toString().startsWith("4")) {
              return HttpException(-1, "客户端错误");
            }
            if (errCode.toString().startsWith("5")) {
              return HttpException(-1, "服务器错误");
            } else {
              return HttpException(errCode, error.response!.statusMessage!);
            }
          } on Exception catch (_) {
            return HttpException(-1, "未知错误");
          }
        }
      default:
        {
          return HttpException(-1, error.error.message);
        }
    }
  }
}
