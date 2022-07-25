import 'http_exception.dart';

class HttpResponse {
  late bool isSuccess;

  dynamic? data;

  HttpException? error;

  HttpResponse._internal({this.isSuccess = false});

  HttpResponse.success(this.data) {
    isSuccess = true;
  }

  HttpResponse.fail({String? errorMsg, int? errorCode}) {
    error = BadRequestException(message: errorMsg, code: errorCode);
    isSuccess = false;
  }

  HttpResponse.failFormResponse({dynamic? data}) {
    error = BadResponseException(data);
    isSuccess = false;
  }

  HttpResponse.failFromError([HttpException? error]) {
    this.error = error ?? UnknownException();
    isSuccess = false;
  }
}
