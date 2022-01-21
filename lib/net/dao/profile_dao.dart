import 'package:dio/dio.dart';
import 'package:imitate_yay/model/profile/profile_model.dart';
import 'package:imitate_yay/model/profile/profile_post_model.dart';

class ProfileDao {
  /// https://api.yay.space/v2/users/2779412
  /// 获取用户信息
  static Future<ProfileModel> getProfileData() async {
    String url = "https://api.yay.space/v2/users/2779412";
    var response = await Dio().get(url);
    return ProfileModel.fromJson(response.data);
  }

  /// https://api.yay.space/v2/posts/user_timeline?user_id=2779412&number=50
  /// 获取登录用户发布的信息
  static Future<ProfilePostModel> getProfilePostData() async {
    String url = "https://api.yay.space/v2/posts/user_timeline?user_id=2779412&number=50";
    var response = await Dio().get(url);
    return ProfilePostModel.fromJson(response.data);
  }
}
