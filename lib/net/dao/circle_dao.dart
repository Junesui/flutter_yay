import 'package:dio/dio.dart';
import 'package:imitate_yay/model/circle/circle_category_model.dart';
import 'package:imitate_yay/model/circle/circle_group_model.dart';

class CircleDao {
  /// https://api.yay.space/v1/groups/categories?number=100
  ///  TabBar 显示的分类
  static Future<CircleCategoryModel> getCategory() async {
    String url = "https://api.yay.space/v1/groups/categories?number=100";
    var response = await Dio().get(url);
    return CircleCategoryModel.fromJson(response.data);
  }

  ///  参加中：https://api.yay.space/v1/groups/user_group_list?number=50&user_id=2779412
  ///　全て：  https://api.yay.space/v2/groups?number=50
  ///　ゲーム：https://api.yay.space/v2/groups?group_category_id=4&number=50
  /// アニメ：https://api.yay.space/v2/groups?group_category_id=1&number=50
  /// 讨论组. -1:参加中的讨论组； 0:所有； 其他:分类下的讨论组
  static Future<CircleGroupModel> getGroup(int cid) async {
    String url;
    if (cid == -1) {
      url = "https://api.yay.space/v1/groups/user_group_list?number=50&user_id=2779412";
    } else if (cid == 0) {
      url = "https://api.yay.space/v2/groups?number=50";
    } else {
      url = "https://api.yay.space/v2/groups?group_category_id=$cid&number=50";
    }
    var response = await Dio().get(url);
    return CircleGroupModel.fromJson(response.data);
  }
}
