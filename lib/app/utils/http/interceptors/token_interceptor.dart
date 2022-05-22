import 'package:dio/dio.dart';
import 'package:flutter_app/app/utils/http/http.dart';

class TokenInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers['refreshToken'] == null) {
      Http.instance.dio.lock();
      Dio dio = Dio();
      dio
        ..get("http://localhost:8080/getRefreshToken").then((res) {
          options.headers['refreshToken'] = res;
          handler.next(options);
        }).catchError((error, stackTrace) {
          handler.reject(error, true);
        }).whenComplete(() {
          Http.instance.dio.unlock();
        }); // unlock the dio
    } else {
      options.headers['refreshToken'] = options.headers['refreshToken'];
      handler.next(options);
    }
  }
}
