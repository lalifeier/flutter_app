import 'package:dio/dio.dart';

Interceptor createLogInterceptor({
  responseBody = true,
  error = true,
  requestHeader = false,
  responseHeader = false,
  requestBody = true,
}) {
  return LogInterceptor(
    responseBody: responseBody,
    error: error,
    requestHeader: requestHeader,
    responseHeader: responseHeader,
    requestBody: requestBody,
  );
}
