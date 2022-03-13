import 'package:dio/dio.dart';
import 'package:imitate_yay/net/http/interceptor/my_error_interceptor.dart';
import 'package:imitate_yay/net/http/interceptor/my_request_interceptor.dart';

/// http 请求类
class HttpRequest {
  // dio
  static late final Dio dio;
  // 取消请求token
  final CancelToken _cancelToken = CancelToken();

  static final HttpRequest _instance = HttpRequest._internal();
  factory HttpRequest() => _instance;
  HttpRequest._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions();
    dio = Dio(options);

    // 添加request拦截器
    dio.interceptors.add(MyRequestInterceptor());
    // 添加error拦截器
    dio.interceptors.add(MyErrorInterceptor());
  }

  /// 初始化
  void init({
    String? baseUrl,
    int connectTimeout = 15000,
    int receiveTimeout = 15000,
    Map<String, String>? headers,
  }) {
    HttpRequest._instance;
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    HttpRequest._instance.addHeaders(headers ?? {});
  }

  /// 添加 headers
  void addHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

  /// 取消请求。
  /// 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
  void cancelRequest({CancelToken? token}) {
    if (token == null) {
      _cancelToken.cancel();
    } else {
      token.cancel();
    }
  }

  /// get 请求
  Future get(String path, {Map<String, dynamic>? params, CancelToken? cancelToken}) async {
    Response response = await dio.get(
      path,
      queryParameters: params,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// post 请求
  Future post(String path, {data, CancelToken? cancelToken}) async {
    Response response = await dio.post(
      path,
      data: data,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }
}
