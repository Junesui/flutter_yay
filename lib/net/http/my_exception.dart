import 'package:dio/dio.dart';

/// 自定义异常
class MyException implements Exception {
  final String _message;
  final int _code;

  MyException(
    this._code,
    this._message,
  );

  @override
  String toString() {
    return "$_code : $_message";
  }

  String getMessage() {
    return _message;
  }

  factory MyException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        {
          return MyException(-1, "连接超时");
        }
      case DioErrorType.sendTimeout:
        {
          return MyException(-1, "请求超时");
        }
      case DioErrorType.receiveTimeout:
        {
          return MyException(-1, "响应超时");
        }
      case DioErrorType.response:
        {
          try {
            int? errCode = error.response!.statusCode;
            switch (errCode) {
              case 400:
                {
                  return MyException(errCode!, "请求语法错误");
                }
              case 401:
                {
                  return MyException(errCode!, "没有权限");
                }
              case 403:
                {
                  return MyException(errCode!, "服务器拒绝执行");
                }
              case 404:
                {
                  return MyException(errCode!, "无法连接服务器");
                }
              case 405:
                {
                  return MyException(errCode!, "请求方法被禁止");
                }
              case 500:
                {
                  return MyException(errCode!, "服务器内部错误");
                }
              case 502:
                {
                  return MyException(errCode!, "无效的请求");
                }
              case 503:
                {
                  return MyException(errCode!, "服务器挂了");
                }
              case 505:
                {
                  return MyException(errCode!, "不支持HTTP协议请求");
                }
              default:
                {
                  return MyException(errCode!, error.response!.statusMessage!);
                }
            }
          } on Exception catch (_) {
            return MyException(-1, "未知错误");
          }
        }
      // case DioErrorType.cancel:
      //   {
      //     return MyException(-1, "请求取消");
      //   }
      default:
        {
          return MyException(-1, error.error.message!);
        }
    }
  }
}
