import 'package:imitate_yay/net/http/http_exception.dart';

/// 接口调用完成之后的共通返回类
class ApiResponse<T> {
  // 状态
  Status status;
  // 返回的数据
  T? data;
  // 异常
  HttpException? exception;

  // 成功
  ApiResponse.ok(this.data) : status = Status.ok;
  // 异常
  ApiResponse.error(this.exception) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $exception \n Data : $data";
  }
}

/// 自定义状态
enum Status { ok, error }
