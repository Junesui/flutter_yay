/// result : "success"
/// user : {"id":2779412,"username":null,"nickname":"シン","prefecture":"千葉県","biography":"お願いします","followers_count":27,"followings_count":24,"gender":0,"ticket":0,"is_private":false,"title":null,"posts_count":9,"groups_users_count":4,"reviews_count":0,"login_streak_count":14,"age_verified":true,"generation":3,"country_code":"JP","is_online":true,"online_status":"online","profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/12/15/rBi9UVCPokoSfmtc_1639529855_0_size_1536x1536.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/12/15/thumb_rBi9UVCPokoSfmtc_1639529855_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2021/4/12/6138C30F-4B02-4B03-A37D-D9900E393753_1618235359_0.jpg","cover_image_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2021/4/12/thumb_6138C30F-4B02-4B03-A37D-D9900E393753_1618235359_0.jpg","last_loggedin_at":1642652194,"created_at":1617060721,"vip":false,"mutual_chat":false,"chat_request":false,"chat_required_phone_verification":false,"age_restricted_on_review":false,"following_restricted_on_review":false,"restricted_review_by":false,"mobile_verified":false,"recently_kenta":false,"dangerous_user":false,"new_user":false}

class ProfileModel {
  ProfileModel({
    this.result,
    this.user,
  });

  ProfileModel.fromJson(dynamic json) {
    result = json['result'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? result;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

/// id : 2779412
/// username : null
/// nickname : "シン"
/// prefecture : "千葉県"
/// biography : "お願いします"
/// followers_count : 27
/// followings_count : 24
/// gender : 0
/// ticket : 0
/// is_private : false
/// title : null
/// posts_count : 9
/// groups_users_count : 4
/// reviews_count : 0
/// login_streak_count : 14
/// age_verified : true
/// generation : 3
/// country_code : "JP"
/// is_online : true
/// online_status : "online"
/// profile_icon : "https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/12/15/rBi9UVCPokoSfmtc_1639529855_0_size_1536x1536.jpg"
/// profile_icon_thumbnail : "https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/12/15/thumb_rBi9UVCPokoSfmtc_1639529855_0_size_1536x1536.jpg"
/// cover_image : "https://yay-cdn.com/file/yay-space/uploads/user_cover/2021/4/12/6138C30F-4B02-4B03-A37D-D9900E393753_1618235359_0.jpg"
/// cover_image_thumbnail : "https://yay-cdn.com/file/yay-space/uploads/user_cover/2021/4/12/thumb_6138C30F-4B02-4B03-A37D-D9900E393753_1618235359_0.jpg"
/// last_loggedin_at : 1642652194
/// created_at : 1617060721
/// vip : false
/// mutual_chat : false
/// chat_request : false
/// chat_required_phone_verification : false
/// age_restricted_on_review : false
/// following_restricted_on_review : false
/// restricted_review_by : false
/// mobile_verified : false
/// recently_kenta : false
/// dangerous_user : false
/// new_user : false

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
    this.mutualChat,
    this.chatRequest,
    this.chatRequiredPhoneVerification,
    this.ageRestrictedOnReview,
    this.followingRestrictedOnReview,
    this.restrictedReviewBy,
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
    mutualChat = json['mutual_chat'];
    chatRequest = json['chat_request'];
    chatRequiredPhoneVerification = json['chat_required_phone_verification'];
    ageRestrictedOnReview = json['age_restricted_on_review'];
    followingRestrictedOnReview = json['following_restricted_on_review'];
    restrictedReviewBy = json['restricted_review_by'];
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
  bool? mutualChat;
  bool? chatRequest;
  bool? chatRequiredPhoneVerification;
  bool? ageRestrictedOnReview;
  bool? followingRestrictedOnReview;
  bool? restrictedReviewBy;
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
    map['mutual_chat'] = mutualChat;
    map['chat_request'] = chatRequest;
    map['chat_required_phone_verification'] = chatRequiredPhoneVerification;
    map['age_restricted_on_review'] = ageRestrictedOnReview;
    map['following_restricted_on_review'] = followingRestrictedOnReview;
    map['restricted_review_by'] = restrictedReviewBy;
    map['mobile_verified'] = mobileVerified;
    map['recently_kenta'] = recentlyKenta;
    map['dangerous_user'] = dangerousUser;
    map['new_user'] = newUser;
    return map;
  }
}
