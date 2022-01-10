import 'package:dio/dio.dart';
import 'package:imitate_yay/model/calling_model.dart';

class HomeDao {
  ///  https://api.yay.space/v2/posts/call_timeline?number=1
  ///  首页通话中的房间
  static Future<CallingModel> getCallingTimeLine() async {
    try {
      var response = await Dio().get('https://api.yay.space/v2/posts/call_timeline?number=10');
      return CallingModel.fromJson(response.data);
    } catch (e) {
      print(e.toString());
    }
    return CallingModel();
  }
}
