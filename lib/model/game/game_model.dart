class GameModel {
  GameModel({
    this.games,
    this.result,
    this.fromId,
  });

  GameModel.fromJson(dynamic json) {
    if (json['games'] != null) {
      games = [];
      json['games'].forEach((v) {
        games?.add(Games.fromJson(v));
      });
    }
    result = json['result'];
    fromId = json['from_id'];
  }
  List<Games>? games;
  String? result;
  int? fromId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (games != null) {
      map['games'] = games?.map((v) => v.toJson()).toList();
    }
    map['result'] = result;
    map['from_id'] = fromId;
    return map;
  }
}

class Games {
  Games({
    this.id,
    this.title,
    this.iconUrl,
    this.platformDetails,
  });

  Games.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    iconUrl = json['icon_url'];
    platformDetails = json['platform_details'];
  }
  int? id;
  String? title;
  String? iconUrl;
  dynamic platformDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['icon_url'] = iconUrl;
    map['platform_details'] = platformDetails;
    return map;
  }
}
