import 'package:dio/dio.dart';
import 'package:imitate_yay/model/home_calling_model.dart';
import 'package:imitate_yay/model/home_content_model.dart';

class HomeDao {
  ///  https://api.yay.space/v2/posts/call_timeline?number=1
  ///  首页通话中的房间
  static Future<HomeCallingModel> getCallingTimeLine() async {
    String url = "https://api.yay.space/v2/posts/call_timeline?number=10";
    var response = await Dio().get(url);
    return HomeCallingModel.fromJson(response.data);
  }

  ///  https://api.yay.space/v2/posts/timeline?number=10
  ///  首页发布的内容
  static Future<HomeContentModel> getPostContent() async {
    String url = "https://api.yay.space/v2/posts/timeline?number=50";
    var response = await Dio().get(url);
    return HomeContentModel.fromJson(response.data);
  }
}
