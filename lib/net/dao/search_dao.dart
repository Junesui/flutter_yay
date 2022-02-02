import 'package:dio/dio.dart';
import 'package:imitate_yay/model/search/search_hima_users_model.dart';

class SearchDao {
  /// get : https://api.yay.space/v1/web/users/hima_users?number=50
  ///  首页通话中的房间
  static Future<SearchHimaUsersModel> getHimaUsers() async {
    String url = "https://api.yay.space/v1/web/users/hima_users?number=50";
    var response = await Dio().get(url);
    return SearchHimaUsersModel.fromJson(response.data);
  }
}
