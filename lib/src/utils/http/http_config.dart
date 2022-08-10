import 'package:dio/dio.dart';

class HttpConfig {
  final String? baseUrl;
  final String? pem;
  final String? proxy;
  final String? cookiesPath;
  final List<Interceptor>? interceptors;

  HttpConfig({
    this.baseUrl,
    this.pem,
    this.proxy,
    this.cookiesPath,
    this.interceptors,
  });
}
