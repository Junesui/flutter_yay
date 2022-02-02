class SearchHimaUsersModel {
  SearchHimaUsersModel({
    this.himaUsers,
    this.result,
  });

  SearchHimaUsersModel.fromJson(dynamic json) {
    if (json['hima_users'] != null) {
      himaUsers = [];
      json['hima_users'].forEach((v) {
        himaUsers?.add(HimaUsers.fromJson(v));
      });
    }
    result = json['result'];
  }
  List<HimaUsers>? himaUsers;
  String? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (himaUsers != null) {
      map['hima_users'] = himaUsers?.map((v) => v.toJson()).toList();
    }
    map['result'] = result;
    return map;
  }
}

class HimaUsers {
  HimaUsers({
    this.id,
    this.user,
  });

  HimaUsers.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.username,
    this.nickname,
    this.prefecture,
    this.biography,
    this.followersCount,
    this.followingsCount,
    this.gender,
    this.ticket,
    this.isPrivate,
    this.title,
    this.postsCount,
    this.groupsUsersCount,
    this.reviewsCount,
    this.loginStreakCount,
    this.ageVerified,
    this.generation,
    this.countryCode,
    this.isOnline,
    this.onlineStatus,
    this.profileIcon,
    this.profileIconThumbnail,
    this.coverImage,
    this.coverImageThumbnail,
    this.lastLoggedinAt,
    this.createdAt,
    this.vip,
    this.mobileVerified,
    this.recentlyKenta,
    this.dangerousUser,
    this.newUser,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    nickname = json['nickname'];
    prefecture = json['prefecture'];
    biography = json['biography'];
    followersCount = json['followers_count'];
    followingsCount = json['followings_count'];
    gender = json['gender'];
    ticket = json['ticket'];
    isPrivate = json['is_private'];
    title = json['title'];
    postsCount = json['posts_count'];
    groupsUsersCount = json['groups_users_count'];
    reviewsCount = json['reviews_count'];
    loginStreakCount = json['login_streak_count'];
    ageVerified = json['age_verified'];
    generation = json['generation'];
    countryCode = json['country_code'];
    isOnline = json['is_online'];
    onlineStatus = json['online_status'];
    profileIcon = json['profile_icon'];
    profileIconThumbnail = json['profile_icon_thumbnail'];
    coverImage = json['cover_image'];
    coverImageThumbnail = json['cover_image_thumbnail'];
    lastLoggedinAt = json['last_loggedin_at'];
    createdAt = json['created_at'];
    vip = json['vip'];
    mobileVerified = json['mobile_verified'];
    recentlyKenta = json['recently_kenta'];
    dangerousUser = json['dangerous_user'];
    newUser = json['new_user'];
  }
  int? id;
  dynamic username;
  String? nickname;
  String? prefecture;
  String? biography;
  int? followersCount;
  int? followingsCount;
  int? gender;
  int? ticket;
  bool? isPrivate;
  dynamic title;
  int? postsCount;
  int? groupsUsersCount;
  int? reviewsCount;
  int? loginStreakCount;
  bool? ageVerified;
  int? generation;
  String? countryCode;
  bool? isOnline;
  String? onlineStatus;
  String? profileIcon;
  String? profileIconThumbnail;
  String? coverImage;
  String? coverImageThumbnail;
  int? lastLoggedinAt;
  int? createdAt;
  bool? vip;
  bool? mobileVerified;
  bool? recentlyKenta;
  bool? dangerousUser;
  bool? newUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['nickname'] = nickname;
    map['prefecture'] = prefecture;
    map['biography'] = biography;
    map['followers_count'] = followersCount;
    map['followings_count'] = followingsCount;
    map['gender'] = gender;
    map['ticket'] = ticket;
    map['is_private'] = isPrivate;
    map['title'] = title;
    map['posts_count'] = postsCount;
    map['groups_users_count'] = groupsUsersCount;
    map['reviews_count'] = reviewsCount;
    map['login_streak_count'] = loginStreakCount;
    map['age_verified'] = ageVerified;
    map['generation'] = generation;
    map['country_code'] = countryCode;
    map['is_online'] = isOnline;
    map['online_status'] = onlineStatus;
    map['profile_icon'] = profileIcon;
    map['profile_icon_thumbnail'] = profileIconThumbnail;
    map['cover_image'] = coverImage;
    map['cover_image_thumbnail'] = coverImageThumbnail;
    map['last_loggedin_at'] = lastLoggedinAt;
    map['created_at'] = createdAt;
    map['vip'] = vip;
    map['mobile_verified'] = mobileVerified;
    map['recently_kenta'] = recentlyKenta;
    map['dangerous_user'] = dangerousUser;
    map['new_user'] = newUser;
    return map;
  }
}
