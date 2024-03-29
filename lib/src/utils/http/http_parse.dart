import 'dart:io';

import 'package:dio/dio.dart';

import 'http_exception.dart';
import 'http_response.dart';
import 'http_transformer.dart';

HttpResponse handleResponse(Response? response,
    {HttpTransformer? httpTransformer}) {
  httpTransformer ??= DefaultHttpTransformer.getInstance();

  if (response == null) {
    return HttpResponse.failFromError();
  }

  if (_isRequestSuccess(response.statusCode)) {
    return httpTransformer.parse(response);
  }

  return HttpResponse.fail(
      errorMsg: response.statusMessage, errorCode: response.statusCode);
}

bool _isRequestSuccess(int? statusCode) {
  return (statusCode != null && statusCode >= 200 && statusCode < 300);
}

HttpResponse handleException(Exception exception) {
  var parseException = _parseException(exception);
  return HttpResponse.failFromError(parseException);
}

HttpException _parseException(Exception error) {
  if (error is DioError) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        return NetworkException(message: error.message);
      case DioErrorType.cancel:
        return CancelException(error.message);
      case DioErrorType.response:
        try {
          int? errCode = error.response?.statusCode;
          print(error.response);
          switch (errCode) {
            case 400:
              return BadRequestException(message: "请求语法错误", code: errCode);
            case 401:
              return UnauthorisedException(message: "没有权限", code: errCode);
            case 403:
              return BadRequestException(message: "服务器拒绝执行", code: errCode);
            case 404:
              return BadRequestException(message: "无法连接服务器", code: errCode);
            case 405:
              return BadRequestException(message: "请求方法被禁止", code: errCode);
            case 500:
              return BadServiceException(message: "服务器内部错误", code: errCode);
            case 502:
              return BadServiceException(message: "无效的请求", code: errCode);
            case 503:
              return BadServiceException(message: "服务器挂了", code: errCode);
            case 505:
              return UnauthorisedException(
                  message: "不支持HTTP协议请求", code: errCode);
            default:
              return UnknownException(error.message);
          }
        } on Exception catch (_) {
          return UnknownException(error.message);
        }

      case DioErrorType.other:
        if (error.error is SocketException) {
          return NetworkException(message: error.message);
        } else {
          return UnknownException(error.message);
        }
      default:
        return UnknownException(error.message);
    }
  } else {
    return UnknownException(error.toString());
  }
}
