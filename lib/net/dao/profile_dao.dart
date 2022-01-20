import 'package:dio/dio.dart';
import 'package:imitate_yay/model/profile/profile_model.dart';

class ProfileDao {
  /// https://api.yay.space/v2/users/2779412
  /// 获取用户信息
  static Future<ProfileModel> getProfileData() async {
    String url = "https://api.yay.space/v2/users/2779412";
    var response = await Dio().get(url);
    return ProfileModel.fromJson(response.data);
  }
}
