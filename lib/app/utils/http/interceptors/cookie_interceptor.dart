import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

Interceptor createCookieInterceptor([String? dir]) {
  final CookieJar cookieJar = PersistCookieJar(storage: FileStorage(dir));
  return CookieManager(cookieJar);
}
