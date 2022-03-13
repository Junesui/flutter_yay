import 'package:dio/dio.dart';
import 'package:imitate_yay/net/http/api_response.dart';
import 'package:imitate_yay/net/http/http_request.dart';
import 'package:imitate_yay/util/toast_util.dart';

class HttpUtil {
  /// 初始化
  static void init({
    required String baseUrl,
    int connectTimeout = 15000,
    int receiveTimeout = 15000,
  }) {
    HttpRequest().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
  }

  /// 添加 header
  static void addHeaders(Map<String, dynamic> map) {
    HttpRequest().addHeaders(map);
  }

  /// 取消请求
  static void cancelRequests({CancelToken? token}) {
    HttpRequest().cancelRequest(token: token);
  }

  /// get 请求
  static Future get(String path, {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    try {
      dynamic respData = await HttpRequest().get(
        path,
        params: params,
        cancelToken: cancelToken,
      );
      return ApiResponse.ok(respData);
    } on DioError catch (e) {
      if (e.error.getMessage() != "请求取消") {
        ToastUtil.show(msg: e.error.getMessage());
      }
      return ApiResponse.error(e.error);
    }
  }

  /// post 请求
  static Future post(String path, {data, CancelToken? cancelToken}) async {
    try {
      dynamic respData = await HttpRequest().post(
        path,
        data: data,
        cancelToken: cancelToken,
      );
      return ApiResponse.ok(respData);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
