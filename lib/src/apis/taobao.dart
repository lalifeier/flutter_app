import '../models/index.dart';
import '../utils/index.dart';

class TaoBaoApi {
  static Future<GetCarouseListResponse> getCarouseList() async {
    var response = await http.get('/goods/topic/carouse-list');
    return GetCarouseListResponse.fromJson(response.data);
  }

  static Future<GetSuperCategoryResponse> GetSuperCategory() async {
    var response = await http.get('/category/get-super-category');
    return GetSuperCategoryResponse.fromJson(response.data);
  }
}
