import '../models/index.dart';
import '../utils/index.dart';

class UserApi {
  static Future<LoginResponse> login(LoginRequest? params) async {
    var response = await http.post(
      '/user/login',
      data: params,
    );
    return LoginResponse.fromJson(response.data);
  }
}
