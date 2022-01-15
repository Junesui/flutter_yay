/// group_categories : [{"id":4,"name":"ゲーム","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/4/group_category_icon/4.png"},{"id":1,"name":"アニメ","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/1/group_category_icon/1.png"},{"id":17,"name":"雑談","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/17/group_category_icon/17.png"},{"id":10,"name":"自分磨き","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/10/group_category_icon/10.png"},{"id":13,"name":"音楽","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/13/group_category_icon/13.png"},{"id":14,"name":"アイドル","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/14/group_category_icon/14.png"},{"id":16,"name":"悩み相談","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/16/group_category_icon/16.png"},{"id":21,"name":"その他","icon":"https://yay-cdn.com/file/yay-space/uploads/group_category/21/group_category_icon/99.png"}]
/// result : "success"

class CircleCategoryModel {
  CircleCategoryModel({
    this.groupCategories,
    this.result,
  });

  CircleCategoryModel.fromJson(dynamic json) {
    if (json['group_categories'] != null) {
      groupCategories = [];
      json['group_categories'].forEach((v) {
        groupCategories?.add(GroupCategories.fromJson(v));
      });
    }
    result = json['result'];
  }
  List<GroupCategories>? groupCategories;
  String? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (groupCategories != null) {
      map['group_categories'] = groupCategories?.map((v) => v.toJson()).toList();
    }
    map['result'] = result;
    return map;
  }
}

/// id : 4
/// name : "ゲーム"
/// icon : "https://yay-cdn.com/file/yay-space/uploads/group_category/4/group_category_icon/4.png"

class GroupCategories {
  GroupCategories({
    this.id,
    this.name,
    this.icon,
  });

  GroupCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }
  int? id;
  String? name;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    return map;
  }
}
