import 'package:imitate_yay/net/http/my_exception.dart';

/// 接口调用完成之后的共通返回类
class ApiResponse<T> {
  Status status;
  T? data;
  MyException? exception;
  ApiResponse.ok(this.data) : status = Status.ok;
  ApiResponse.error(this.exception) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $exception \n Data : $data";
  }
}

enum Status { ok, error }
