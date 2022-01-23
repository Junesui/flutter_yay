class ProfilePostModel {
  ProfilePostModel({
    this.result,
    this.posts,
    this.pinnedPost,
  });

  ProfilePostModel.fromJson(dynamic json) {
    result = json['result'];
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
    pinnedPost = json['pinned_post'] != null ? Pinned_post.fromJson(json['pinned_post']) : null;
  }
  String? result;
  List<Posts>? posts;
  Pinned_post? pinnedPost;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = result;
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    if (pinnedPost != null) {
      map['pinned_post'] = pinnedPost?.toJson();
    }
    return map;
  }
}

class Pinned_post {
  Pinned_post({
    this.id,
    this.text,
    this.groupId,
    this.fontSize,
    this.likesCount,
    this.postType,
    this.color,
    this.repostsCount,
    this.createdAt,
    this.updatedAt,
    this.reportedCount,
    this.inReplyToPostCount,
    this.repostable,
    this.attachment,
    this.attachmentThumbnail,
    this.user,
  });

  Pinned_post.fromJson(dynamic json) {
    id = json['id'];
    text = json['text'];
    groupId = json['group_id'];
    fontSize = json['font_size'];
    likesCount = json['likes_count'];
    postType = json['post_type'];
    color = json['color'];
    repostsCount = json['reposts_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reportedCount = json['reported_count'];
    inReplyToPostCount = json['in_reply_to_post_count'];
    repostable = json['repostable'];
    attachment = json['attachment'];
    attachmentThumbnail = json['attachment_thumbnail'];

    attachment2Thumbnail = json['attachment_2_thumbnail'];
    attachment3Thumbnail = json['attachment_3_thumbnail'];
    attachment4Thumbnail = json['attachment_4_thumbnail'];
    attachment5Thumbnail = json['attachment_5_thumbnail'];
    attachment6Thumbnail = json['attachment_6_thumbnail'];
    attachment7Thumbnail = json['attachment_7_thumbnail'];
    attachment8Thumbnail = json['attachment_8_thumbnail'];
    attachment9Thumbnail = json['attachment_9_thumbnail'];

    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  String? text;
  dynamic groupId;
  int? fontSize;
  int? likesCount;
  String? postType;
  int? color;
  int? repostsCount;
  int? createdAt;
  int? updatedAt;
  int? reportedCount;
  int? inReplyToPostCount;
  bool? repostable;
  String? attachment;
  String? attachmentThumbnail;
  String? attachment2Thumbnail;
  String? attachment3Thumbnail;
  String? attachment4Thumbnail;
  String? attachment5Thumbnail;
  String? attachment6Thumbnail;
  String? attachment7Thumbnail;
  String? attachment8Thumbnail;
  String? attachment9Thumbnail;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    map['group_id'] = groupId;
    map['font_size'] = fontSize;
    map['likes_count'] = likesCount;
    map['post_type'] = postType;
    map['color'] = color;
    map['reposts_count'] = repostsCount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['reported_count'] = reportedCount;
    map['in_reply_to_post_count'] = inReplyToPostCount;
    map['repostable'] = repostable;
    map['attachment'] = attachment;
    map['attachment_thumbnail'] = attachmentThumbnail;

    map['attachment_2_thumbnail'] = attachment2Thumbnail;
    map['attachment_3_thumbnail'] = attachment3Thumbnail;
    map['attachment_4_thumbnail'] = attachment4Thumbnail;
    map['attachment_5_thumbnail'] = attachment5Thumbnail;
    map['attachment_6_thumbnail'] = attachment6Thumbnail;
    map['attachment_7_thumbnail'] = attachment7Thumbnail;
    map['attachment_8_thumbnail'] = attachment8Thumbnail;
    map['attachment_9_thumbnail'] = attachment9Thumbnail;

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
    this.profileIcon,
    this.coverImage,
    this.profileIconThumbnail,
    this.lastLoggedinAt,
    this.createdAt,
    this.loginStreakCount,
    this.isOnline,
    this.onlineStatus,
    this.countryCode,
    this.vip,
    this.mobileVerified,
    this.ageVerified,
    this.recentlyKenta,
    this.dangerousUser,
    this.generation,
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
    profileIcon = json['profile_icon'];
    coverImage = json['cover_image'];
    profileIconThumbnail = json['profile_icon_thumbnail'];
    lastLoggedinAt = json['last_loggedin_at'];
    createdAt = json['created_at'];
    loginStreakCount = json['login_streak_count'];
    isOnline = json['is_online'];
    onlineStatus = json['online_status'];
    countryCode = json['country_code'];
    vip = json['vip'];
    mobileVerified = json['mobile_verified'];
    ageVerified = json['age_verified'];
    recentlyKenta = json['recently_kenta'];
    dangerousUser = json['dangerous_user'];
    generation = json['generation'];
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
  String? profileIcon;
  String? coverImage;
  String? profileIconThumbnail;
  int? lastLoggedinAt;
  int? createdAt;
  int? loginStreakCount;
  bool? isOnline;
  String? onlineStatus;
  String? countryCode;
  bool? vip;
  bool? mobileVerified;
  bool? ageVerified;
  bool? recentlyKenta;
  bool? dangerousUser;
  int? generation;
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
    map['profile_icon'] = profileIcon;
    map['cover_image'] = coverImage;
    map['profile_icon_thumbnail'] = profileIconThumbnail;
    map['last_loggedin_at'] = lastLoggedinAt;
    map['created_at'] = createdAt;
    map['login_streak_count'] = loginStreakCount;
    map['is_online'] = isOnline;
    map['online_status'] = onlineStatus;
    map['country_code'] = countryCode;
    map['vip'] = vip;
    map['mobile_verified'] = mobileVerified;
    map['age_verified'] = ageVerified;
    map['recently_kenta'] = recentlyKenta;
    map['dangerous_user'] = dangerousUser;
    map['generation'] = generation;
    map['new_user'] = newUser;
    return map;
  }
}

class Posts {
  Posts({
    this.id,
    this.text,
    this.groupId,
    this.fontSize,
    this.likesCount,
    this.postType,
    this.color,
    this.repostsCount,
    this.createdAt,
    this.updatedAt,
    this.reportedCount,
    this.inReplyToPostCount,
    this.repostable,
    this.attachment,
    this.attachmentThumbnail,
    this.attachment2Thumbnail,
    this.attachment3Thumbnail,
    this.attachment4Thumbnail,
    this.attachment5Thumbnail,
    this.attachment6Thumbnail,
    this.attachment7Thumbnail,
    this.attachment8Thumbnail,
    this.attachment9Thumbnail,
    this.user,
    this.conferenceCall,
  });

  Posts.fromJson(dynamic json) {
    id = json['id'];
    text = json['text'];
    groupId = json['group_id'];
    fontSize = json['font_size'];
    likesCount = json['likes_count'];
    postType = json['post_type'];
    color = json['color'];
    repostsCount = json['reposts_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reportedCount = json['reported_count'];
    inReplyToPostCount = json['in_reply_to_post_count'];
    repostable = json['repostable'];
    attachment = json['attachment'];
    attachmentThumbnail = json['attachment_thumbnail'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    conferenceCall =
        json['conference_call'] != null ? Conference_call.fromJson(json['conference_call']) : null;
  }
  int? id;
  String? text;
  dynamic groupId;
  int? fontSize;
  int? likesCount;
  String? postType;
  int? color;
  int? repostsCount;
  int? createdAt;
  int? updatedAt;
  int? reportedCount;
  int? inReplyToPostCount;
  bool? repostable;
  String? attachment;
  String? attachmentThumbnail;
  String? attachment2Thumbnail;
  String? attachment3Thumbnail;
  String? attachment4Thumbnail;
  String? attachment5Thumbnail;
  String? attachment6Thumbnail;
  String? attachment7Thumbnail;
  String? attachment8Thumbnail;
  String? attachment9Thumbnail;
  User? user;
  Conference_call? conferenceCall;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    map['group_id'] = groupId;
    map['font_size'] = fontSize;
    map['likes_count'] = likesCount;
    map['post_type'] = postType;
    map['color'] = color;
    map['reposts_count'] = repostsCount;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['reported_count'] = reportedCount;
    map['in_reply_to_post_count'] = inReplyToPostCount;
    map['repostable'] = repostable;
    map['attachment'] = attachment;
    map['attachment_thumbnail'] = attachmentThumbnail;

    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (conferenceCall != null) {
      map['conference_call'] = conferenceCall?.toJson();
    }
    return map;
  }
}

class Conference_call {
  Conference_call({
    this.id,
    this.active,
    this.conferenceCallUsersCount,
    this.callType,
    this.server,
    this.mode,
    this.agoraChannel,
    this.agoraToken,
    this.locked,
    this.open,
    this.anonymousCallUsersCount,
    this.joinableBy,
    this.maxParticipants,
    this.postId,
    this.duration,
    this.game,
    this.conferenceCallUsers,
  });

  Conference_call.fromJson(dynamic json) {
    id = json['id'];
    active = json['active'];
    conferenceCallUsersCount = json['conference_call_users_count'];
    callType = json['call_type'];
    server = json['server'];
    mode = json['mode'];
    agoraChannel = json['agora_channel'];
    agoraToken = json['agora_token'];
    locked = json['locked'];
    open = json['open'];
    anonymousCallUsersCount = json['anonymous_call_users_count'];
    joinableBy = json['joinable_by'];
    maxParticipants = json['max_participants'];
    postId = json['post_id'];
    duration = json['duration'];
    game = json['game'];
    if (json['conference_call_users'] != null) {
      conferenceCallUsers = [];
      json['conference_call_users'].forEach((v) {
        conferenceCallUsers?.add(Conference_call_users.fromJson(v));
      });
    }
  }
  int? id;
  bool? active;
  int? conferenceCallUsersCount;
  dynamic callType;
  String? server;
  String? mode;
  String? agoraChannel;
  String? agoraToken;
  bool? locked;
  bool? open;
  int? anonymousCallUsersCount;
  String? joinableBy;
  int? maxParticipants;
  int? postId;
  int? duration;
  dynamic game;
  List<Conference_call_users>? conferenceCallUsers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['active'] = active;
    map['conference_call_users_count'] = conferenceCallUsersCount;
    map['call_type'] = callType;
    map['server'] = server;
    map['mode'] = mode;
    map['agora_channel'] = agoraChannel;
    map['agora_token'] = agoraToken;
    map['locked'] = locked;
    map['open'] = open;
    map['anonymous_call_users_count'] = anonymousCallUsersCount;
    map['joinable_by'] = joinableBy;
    map['max_participants'] = maxParticipants;
    map['post_id'] = postId;
    map['duration'] = duration;
    map['game'] = game;
    if (conferenceCallUsers != null) {
      map['conference_call_users'] = conferenceCallUsers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Conference_call_users {
  Conference_call_users({
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
    this.profileIcon,
    this.coverImage,
    this.profileIconThumbnail,
    this.lastLoggedinAt,
    this.createdAt,
    this.loginStreakCount,
    this.isOnline,
    this.onlineStatus,
    this.countryCode,
    this.vip,
    this.mobileVerified,
    this.ageVerified,
    this.recentlyKenta,
    this.dangerousUser,
    this.generation,
    this.newUser,
  });

  Conference_call_users.fromJson(dynamic json) {
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
    profileIcon = json['profile_icon'];
    coverImage = json['cover_image'];
    profileIconThumbnail = json['profile_icon_thumbnail'];
    lastLoggedinAt = json['last_loggedin_at'];
    createdAt = json['created_at'];
    loginStreakCount = json['login_streak_count'];
    isOnline = json['is_online'];
    onlineStatus = json['online_status'];
    countryCode = json['country_code'];
    vip = json['vip'];
    mobileVerified = json['mobile_verified'];
    ageVerified = json['age_verified'];
    recentlyKenta = json['recently_kenta'];
    dangerousUser = json['dangerous_user'];
    generation = json['generation'];
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
  String? profileIcon;
  String? coverImage;
  String? profileIconThumbnail;
  int? lastLoggedinAt;
  int? createdAt;
  int? loginStreakCount;
  bool? isOnline;
  String? onlineStatus;
  String? countryCode;
  bool? vip;
  bool? mobileVerified;
  bool? ageVerified;
  bool? recentlyKenta;
  bool? dangerousUser;
  int? generation;
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
    map['profile_icon'] = profileIcon;
    map['cover_image'] = coverImage;
    map['profile_icon_thumbnail'] = profileIconThumbnail;
    map['last_loggedin_at'] = lastLoggedinAt;
    map['created_at'] = createdAt;
    map['login_streak_count'] = loginStreakCount;
    map['is_online'] = isOnline;
    map['online_status'] = onlineStatus;
    map['country_code'] = countryCode;
    map['vip'] = vip;
    map['mobile_verified'] = mobileVerified;
    map['age_verified'] = ageVerified;
    map['recently_kenta'] = recentlyKenta;
    map['dangerous_user'] = dangerousUser;
    map['generation'] = generation;
    map['new_user'] = newUser;
    return map;
  }
}
