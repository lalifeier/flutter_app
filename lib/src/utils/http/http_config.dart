import 'package:dio/dio.dart';

class HttpConfig {
  final String? baseUrl;
  final String? pem;
  final String? proxy;
  final List<Interceptor>? interceptors;

  final bool? logInterceptor;
  final bool? cacheInterceptor;
  final bool? cookieInterceptor;
  final bool? retryInterceptor;

  HttpConfig({
    this.baseUrl,
    this.pem,
    this.proxy,
    this.interceptors,
    this.logInterceptor,
    this.cacheInterceptor,
    this.cookieInterceptor,
    this.retryInterceptor,
  });
}
