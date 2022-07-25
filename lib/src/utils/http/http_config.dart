import 'package:dio/dio.dart';

class HttpConfig {
  final String? proxy;
  final List<Interceptor>? interceptors;

  final bool? logInterceptor;
  final bool? cacheInterceptor;
  final bool? cookieInterceptor;
  final bool? retryInterceptor;

  HttpConfig(
      {this.proxy,
      this.interceptors,
      this.logInterceptor,
      this.cacheInterceptor,
      this.cookieInterceptor,
      this.retryInterceptor});
}
