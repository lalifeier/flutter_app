import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'http_config.dart';
import 'interceptors/cache_interceptor.dart';
import 'interceptors/cookie_interceptor.dart';
import 'interceptors/log_interceptor.dart';

class Http with DioMixin implements Dio {
  Http({BaseOptions? options, HttpConfig? httpConfig}) {
    options ??= BaseOptions(
      baseUrl: httpConfig?.baseUrl ?? "",
      contentType: 'application/json',
      connectTimeout: Duration.millisecondsPerMinute,
      sendTimeout: Duration.millisecondsPerMinute,
      receiveTimeout: Duration.millisecondsPerMinute,
    );
    this.options = options;

    setInterceptor(httpConfig);

    // httpClientAdapter = DefaultHttpClientAdapter();
    // if (httpConfig?.pem?.isNotEmpty ?? false) {
    //   setHttpsCertificateVerification(httpConfig!.pem!);
    // }

    if (httpConfig?.proxy?.isNotEmpty ?? false) {
      setProxy(httpConfig!.proxy!);
    }
  }

  void setInterceptor(HttpConfig? httpConfig) {
    interceptors.add(createLogInterceptor());

    interceptors.add(createCacheInterceptor());

    if (httpConfig?.cookiesPath?.isNotEmpty ?? false) {
      interceptors.add(createCookieInterceptor(httpConfig!.cookiesPath));
    }
    // if (httpConfig?.retryInterceptor != false) {
    //   interceptors
    //       .add(RetryOnConnectionChangeInterceptor(DioConnectivityRequestRetrier(
    //     dio: _dio,
    //     connectivity: Connectivity(),
    //   )));
    // }
    // if (httpConfig?.retryInterceptor != false) {
    // interceptors
    //     .add(RetryInterceptor(dio: dio, logPrint: print, retries: 3));
    // }

    if (httpConfig?.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(interceptors);
    }
  }

  void setHttpsCertificateVerification(String pem) {
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        if (cert.pem == pem) {
          return true;
        }
        return false;
      };
      return null;
    };
  }

  void setProxy(String proxy) {
    (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY $proxy";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }
}
