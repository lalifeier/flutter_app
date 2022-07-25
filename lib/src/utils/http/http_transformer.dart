import 'package:dio/dio.dart';

import 'http_response.dart';

abstract class HttpTransformer {
  HttpResponse parse(Response response);
}

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    if (response.data["code"] == 200) {
      return HttpResponse.success(response.data["data"]);
    } else {
      return HttpResponse.fail(
          errorMsg: response.data["message"], errorCode: response.data["code"]);
    }
  }

  static final DefaultHttpTransformer _instance =
      DefaultHttpTransformer._internal();

  DefaultHttpTransformer._internal();

  factory DefaultHttpTransformer.getInstance() => _instance;
}
