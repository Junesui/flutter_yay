import 'package:dio/dio.dart';
import 'package:imitate_yay/model/profile/profile_follower_model.dart';
import 'package:imitate_yay/model/profile/profile_letter_model.dart';
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
    var response = await Dio().get(
      url,
      options: Options(headers: {
        "authorization": "Bearer 7049d5a4e109a2c1f5a479823cd17e6142e9dadc6ce06988c653d935c205b3e8"
      }),
    );
    return ProfilePostModel.fromJson(response.data);
  }

  /// https://api.yay.space/v1/users/reviews/2779412
  /// 获取留言
  static Future<ProfileLetterModel> getProfileLetterData() async {
    String url = "https://api.yay.space/v1/users/reviews/2779412";
    var response = await Dio().get(url);
    return ProfileLetterModel.fromJson(response.data);
  }

  /// https://api.yay.space/v2/users/2779412/web_followers?number=50
  /// 获取粉丝信息
  static Future<ProfileFollowerModel> getProfileFollowerData() async {
    String url = "https://api.yay.space/v2/users/2779412/web_followers?number=50";
    var response = await Dio().get(url);
    return ProfileFollowerModel.fromJson(response.data);
  }
}
