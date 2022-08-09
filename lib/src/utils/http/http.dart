import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'http_config.dart';

// class Http {
//   late Dio _dio;

//   Dio get dio => _dio;

//   static final Http instance = Http._internal();

//   HttpConfig? httpConfig;
//   BaseOptions? options;

//   factory Http({BaseOptions? options, HttpConfig? httpConfig}) {
//     options ??= BaseOptions();
//     httpConfig = httpConfig;
//     return instance;
//   }

//   Http._internal() {
//     createHttp(options, httpConfig);
//   }

//   createHttp(BaseOptions? options, HttpConfig? httpConfig) {
//     _dio = Dio(options);

//     setInterceptor(httpConfig);

//     if (httpConfig?.pem?.isNotEmpty ?? false) {
//       setHttpsCertificateVerification(httpConfig!.pem!);
//     }

//     if (httpConfig?.proxy?.isNotEmpty ?? false) {
//       setProxy(httpConfig!.proxy!);
//     }
//   }

//   void setInterceptor(HttpConfig? httpConfig) {
//     List<Interceptor> interceptors = [];
//     if (httpConfig?.logInterceptor != false) {
//       interceptors.add(createLogInterceptor());
//     }
//     if (httpConfig?.cacheInterceptor != false) {
//       interceptors.add(createCacheInterceptor());
//     }
//     if (httpConfig?.cookieInterceptor != false) {
//       interceptors.add(createCookieInterceptor());
//     }
//     // if (httpConfig?.retryInterceptor != false) {
//     //   interceptors
//     //       .add(RetryOnConnectionChangeInterceptor(DioConnectivityRequestRetrier(
//     //     dio: _dio,
//     //     connectivity: Connectivity(),
//     //   )));
//     // }
//     if (httpConfig?.retryInterceptor != false) {
//       interceptors
//           .add(RetryInterceptor(dio: _dio, logPrint: print, retries: 3));
//     }

//     _dio.interceptors.addAll(interceptors);
//   }

//   void setHttpsCertificateVerification(String pem) {
//     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (client) {
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) {
//         if (cert.pem == pem) {
//           return true;
//         }
//         return false;
//       };
//       return null;
//     };
//   }

//   void setProxy(String proxy) {
//     (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//         (HttpClient client) {
//       client.findProxy = (uri) {
//         return "PROXY $proxy";
//       };
//       client.badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//       return null;
//     };
//   }

//   void setBaseUrl(String baseUrl) {
//     _dio.options.baseUrl = baseUrl;
//   }

//   void setInterceptors(List<Interceptor> interceptors) {
//     _dio.interceptors.addAll(interceptors);
//   }

//   void setHeaders(Map<String, dynamic> map) {
//     _dio.options.headers.addAll(map);
//   }

//   void setMethod(String method) {
//     _dio.options.method = method;
//   }

//   void setCookie(String cookie) {
//     Map<String, dynamic> headers = {};
//     headers["Cookie"] = cookie;
//     _dio.options.headers.addAll(headers);
//   }
// }

class Http with DioMixin implements Dio {
  Http({BaseOptions? options, HttpConfig? httpConfig}) {
    options ??= BaseOptions(
      baseUrl: httpConfig?.baseUrl ?? "",
      contentType: 'application/json',
      // connectTimeout: dioConfig?.connectTimeout,
      // sendTimeout: dioConfig?.sendTimeout,
      // receiveTimeout: dioConfig?.receiveTimeout,
    );
    this.options = options;

    if (httpConfig?.interceptors?.isNotEmpty ?? false) {
      interceptors.addAll(interceptors);
    }
    httpClientAdapter = DefaultHttpClientAdapter();

    if (httpConfig?.proxy?.isNotEmpty ?? false) {
      setProxy(httpConfig!.proxy!);
    }

    // if (httpConfig?.pem?.isNotEmpty ?? false) {
    //   setHttpsCertificateVerification(httpConfig!.pem!);
    // }
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
