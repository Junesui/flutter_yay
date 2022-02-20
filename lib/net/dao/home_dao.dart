import 'package:dio/dio.dart';
import 'package:imitate_yay/model/home/home_calling_model.dart';
import 'package:imitate_yay/model/home/home_content_model.dart';

class HomeDao {
  /// get : https://api.yay.space/v2/posts/call_timeline?number=1
  ///  首页通话中的房间
  static Future<HomeCallingModel> getCallingTimeLine() async {
    String url = "https://api.yay.space/v2/posts/call_timeline?number=10";
    var response = await Dio().get(url);
    return HomeCallingModel.fromJson(response.data);
  }

  /// get : https://api.yay.space/v2/posts/timeline?number=10
  ///  首页发布的内容
  static Future<HomeContentModel> getPostContent() async {
    String url = "https://api.yay.space/v2/posts/timeline?number=50";
    var response = await Dio().get(url);
    return HomeContentModel.fromJson(response.data);
  }

  /// post : https://api.yay.space/v2/posts/like
  /// 点赞
  static like(int id) async {
    String url = "https://api.yay.space/v2/posts/like";
    var response = await Dio().postUri(Uri.parse(url),
        data: {"post_ids": id},
        options: Options(
          headers: {
            "content-type": "application/json;charset=UTF-8",
            "authorization":
                "Bearer 7049d5a4e109a2c1f5a479823cd17e6142e9dadc6ce06988c653d935c205b3e8"
          },
        ));
    return response.data;
  }
}
