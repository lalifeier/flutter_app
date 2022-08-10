import 'package:dio/dio.dart';

import '../environment.dart';
import 'http.dart';
import 'http_config.dart';
import 'http_parse.dart';
import 'http_response.dart';
import 'http_transformer.dart';

class HttpClient {
  late Http _http;

  CancelToken cancelToken = CancelToken();

  HttpClient({BaseOptions? options, HttpConfig? httpConfig}) {
    _http = Http(options: options, httpConfig: httpConfig);
  }

  Future<HttpResponse> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    return request(
      path,
      params: params,
      method: 'GET',
      options: options,
      cancelToken: cancelToken,
      httpTransformer: httpTransformer,
    );
  }

  Future<HttpResponse> post<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    return request(
      path,
      data: data,
      params: params,
      method: 'POST',
      options: options,
      cancelToken: cancelToken,
      httpTransformer: httpTransformer,
    );
  }

  Future<HttpResponse> put<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    return request(
      path,
      data: data,
      params: params,
      method: 'PUT',
      options: options,
      cancelToken: cancelToken,
      httpTransformer: httpTransformer,
    );
  }

  Future<HttpResponse> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    return request(
      path,
      data: data,
      params: params,
      method: 'DELETE',
      options: options,
      cancelToken: cancelToken,
      httpTransformer: httpTransformer,
    );
  }

  Future<HttpResponse> head<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    return request(
      path,
      data: data,
      params: params,
      method: 'HEAD',
      options: options,
      cancelToken: cancelToken,
      httpTransformer: httpTransformer,
    );
  }

  Future<HttpResponse> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    HttpTransformer? httpTransformer,
  }) async {
    return request(
      path,
      data: data,
      params: params,
      method: 'PATCH',
      options: options,
      cancelToken: cancelToken,
      httpTransformer: httpTransformer,
    );
  }

  Future<HttpResponse> download<T>(
    String path,
    savePath, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
  }) async {
    try {
      Response response = await _http.download(
        path,
        savePath,
        queryParameters: params,
        data: data,
        options: options,
        cancelToken: cancelToken,
        deleteOnError: deleteOnError,
        onReceiveProgress: onReceiveProgress,
        lengthHeader: lengthHeader,
      );
      return handleResponse(response);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  Future<HttpResponse> upload<T>(
    String path, {
    FormData? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    return request(
      path,
      data: data,
      params: params,
      method: 'POST',
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }

  Future<HttpResponse> request<T>(
    String path, {
    data,
    Map<String, dynamic>? params,
    String method = 'GET',
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    HttpTransformer? httpTransformer,
  }) async {
    options ??= Options();
    options.method = method;

    if (headers != null) {
      options.headers = headers;
    }

    try {
      Response response = await _http.request(
        path,
        queryParameters: params,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return handleResponse(response, httpTransformer: httpTransformer);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  void cancelRequests({CancelToken? token}) {
    token ?? cancelToken.cancel("cancelled");
  }
}

// BaseOptions options = BaseOptions(
//   baseUrl: Environment.baseUrl,
//   connectTimeout: Duration.millisecondsPerMinute,
//   sendTimeout: Duration.millisecondsPerMinute,
//   receiveTimeout: Duration.millisecondsPerMinute,
//   // contentType: 'application/json',
// );

HttpConfig httpConfig = HttpConfig(
  baseUrl: Environment.baseUrl,
  // proxy: 'localhost:8888',
);

final HttpClient http = HttpClient(httpConfig: httpConfig);
