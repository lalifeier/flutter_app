import 'package:dio/dio.dart';

class RequestInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('------------------------请求开始------------------------');

    print("url = ${options.uri.toString()}");
    print("method = ${options.method}");
    print("headers = ${options.headers}");
    print("params = ${options.data}");

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('------------------------请求结束------------------------');
    print("code = ${response.statusCode}");
    print("data = ${response.data}");

    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('------------------------请求出错------------------------');
    print("type = ${err.type}");
    print("message = ${err.message}");
    print("stackTrace = ${err.stackTrace}");

    return handler.next(err);
  }
}
