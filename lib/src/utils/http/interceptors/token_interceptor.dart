import 'dart:collection';

import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  bool isReLogin = false;
  Queue queue = Queue();

  TokenInterceptor(this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (!_checkIfNeedRefreshToken(response)) {
      return super.onResponse(response, handler);
    }

    // todo

    return super.onResponse(response, handler);
  }

  bool _checkIfNeedRefreshToken(Response<dynamic> response) {
    return true;
    //   if (response.data == null || response.data.isEmpty) {
    //     return false;
    //   }

    //   var responseMap =
    //       response.data is String ? jsonDecode(response.data) : response.data;
    //   var head = responseMap['head'];
    //   if (head == null) {
    //     return false;
    //   }

    //   var statusCode = head['code'];
    //   if (statusCode != 99999 || "未发现登录用户" != responseMap['data']) {
    //     return false;
    //   }

    //   return true;
  }
}
