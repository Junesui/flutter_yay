/// posts : [{"id":241693362,"text":"だれでも","group_id":null,"font_size":0,"likes_count":1,"post_type":"call","color":0,"reposts_count":0,"created_at":1641809556,"updated_at":1641811149,"reported_count":0,"in_reply_to_post_count":0,"repostable":false,"user":{"id":4726420,"username":null,"nickname":"西村ウォン","prefecture":"","biography":"自分からフォローあんまりしません\n変人仲間→佐々木\nフォローされたら奇跡\n\n九州のどっかに住んでます🚺","followers_count":34,"followings_count":21,"gender":1,"ticket":0,"is_private":true,"title":null,"posts_count":10,"groups_users_count":0,"reviews_count":21,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/4/awrDVYkdGpfv7oR0_1641303230_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","last_loggedin_at":1641810605,"created_at":1641298163,"login_streak_count":7,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":1,"new_user":false},"conference_call":{"id":48487862,"active":true,"conference_call_users_count":3,"call_type":null,"server":"wss://webrtc-p-003.batiapps.com:8443/room","mode":"call","agora_channel":"yay-48487862","agora_token":"00679046b8c9be54945b7f10a4d128d5395IACkQv64KVwxSl/Ab47nAFWP/cpKGRpxbCIx7lrCgtpCAt9LcLgAAAAAIgAaLCLmTV7dYQQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA","locked":false,"open":true,"anonymous_call_users_count":0,"joinable_by":"anyone","max_participants":18,"post_id":241693362,"game":null,"conference_call_users":[{"id":4726420,"username":null,"nickname":"西村ウォン","prefecture":"","biography":"自分からフォローあんまりしません\n変人仲間→佐々木\nフォローされたら奇跡\n\n九州のどっかに住んでます🚺","followers_count":34,"followings_count":21,"gender":1,"ticket":0,"is_private":true,"title":null,"posts_count":10,"groups_users_count":0,"reviews_count":21,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/4/awrDVYkdGpfv7oR0_1641303230_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","last_loggedin_at":1641810605,"created_at":1641298163,"login_streak_count":7,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":1,"new_user":false},{"id":4655915,"username":null,"nickname":"たなか","prefecture":"","biography":"\n\n見てんじゃねぇよ☺️\n\n ","followers_count":4,"followings_count":4,"gender":0,"ticket":0,"is_private":true,"title":null,"posts_count":3,"groups_users_count":0,"reviews_count":1,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/4qTTpVNFkpo5GLNF_1641810202_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/3/Gl3h27qTkTjyUA5G_1641176031_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_4qTTpVNFkpo5GLNF_1641810202_0_size_1536x1536.jpg","last_loggedin_at":1641810276,"created_at":1640211701,"login_streak_count":10,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":false,"recently_kenta":false,"dangerous_user":false,"generation":2,"new_user":false},{"id":3935099,"username":null,"nickname":"高校生Aくん","prefecture":"兵庫県","biography":"関西\n洋楽･弾き語り好き\n僕の歌声を聞いたら\n安らかに永眠してくれるような\n歌声を目指しています\nみんな仲良くしてくれると嬉しいです！","followers_count":343,"followings_count":66,"gender":0,"ticket":0,"is_private":false,"title":null,"posts_count":38,"groups_users_count":0,"reviews_count":26,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/11/18/OtP2wwy725yXhmng_1637231162658_0_size_1097x1097.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2021/10/22/A3JwDtHqKSrQip3z_1634907255778_1_size_856x428.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/11/18/thumb_OtP2wwy725yXhmng_1637231162658_0_size_1097x1097.jpg","last_loggedin_at":1641810320,"created_at":1629534457,"login_streak_count":143,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":true,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":0,"new_user":false}]}}]
/// result : "success"

class HomeCallingModel {
  HomeCallingModel({
    this.posts,
    this.result,
  });

  HomeCallingModel.fromJson(dynamic json) {
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
    result = json['result'];
  }
  List<Posts>? posts;
  String? result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    map['result'] = result;
    return map;
  }
}

/// id : 241693362
/// text : "だれでも"
/// group_id : null
/// font_size : 0
/// likes_count : 1
/// post_type : "call"
/// color : 0
/// reposts_count : 0
/// created_at : 1641809556
/// updated_at : 1641811149
/// reported_count : 0
/// in_reply_to_post_count : 0
/// repostable : false
/// user : {"id":4726420,"username":null,"nickname":"西村ウォン","prefecture":"","biography":"自分からフォローあんまりしません\n変人仲間→佐々木\nフォローされたら奇跡\n\n九州のどっかに住んでます🚺","followers_count":34,"followings_count":21,"gender":1,"ticket":0,"is_private":true,"title":null,"posts_count":10,"groups_users_count":0,"reviews_count":21,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/4/awrDVYkdGpfv7oR0_1641303230_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","last_loggedin_at":1641810605,"created_at":1641298163,"login_streak_count":7,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":1,"new_user":false}
/// conference_call : {"id":48487862,"active":true,"conference_call_users_count":3,"call_type":null,"server":"wss://webrtc-p-003.batiapps.com:8443/room","mode":"call","agora_channel":"yay-48487862","agora_token":"00679046b8c9be54945b7f10a4d128d5395IACkQv64KVwxSl/Ab47nAFWP/cpKGRpxbCIx7lrCgtpCAt9LcLgAAAAAIgAaLCLmTV7dYQQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA","locked":false,"open":true,"anonymous_call_users_count":0,"joinable_by":"anyone","max_participants":18,"post_id":241693362,"game":null,"conference_call_users":[{"id":4726420,"username":null,"nickname":"西村ウォン","prefecture":"","biography":"自分からフォローあんまりしません\n変人仲間→佐々木\nフォローされたら奇跡\n\n九州のどっかに住んでます🚺","followers_count":34,"followings_count":21,"gender":1,"ticket":0,"is_private":true,"title":null,"posts_count":10,"groups_users_count":0,"reviews_count":21,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/4/awrDVYkdGpfv7oR0_1641303230_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","last_loggedin_at":1641810605,"created_at":1641298163,"login_streak_count":7,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":1,"new_user":false},{"id":4655915,"username":null,"nickname":"たなか","prefecture":"","biography":"\n\n見てんじゃねぇよ☺️\n\n ","followers_count":4,"followings_count":4,"gender":0,"ticket":0,"is_private":true,"title":null,"posts_count":3,"groups_users_count":0,"reviews_count":1,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/4qTTpVNFkpo5GLNF_1641810202_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/3/Gl3h27qTkTjyUA5G_1641176031_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_4qTTpVNFkpo5GLNF_1641810202_0_size_1536x1536.jpg","last_loggedin_at":1641810276,"created_at":1640211701,"login_streak_count":10,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":false,"recently_kenta":false,"dangerous_user":false,"generation":2,"new_user":false},{"id":3935099,"username":null,"nickname":"高校生Aくん","prefecture":"兵庫県","biography":"関西\n洋楽･弾き語り好き\n僕の歌声を聞いたら\n安らかに永眠してくれるような\n歌声を目指しています\nみんな仲良くしてくれると嬉しいです！","followers_count":343,"followings_count":66,"gender":0,"ticket":0,"is_private":false,"title":null,"posts_count":38,"groups_users_count":0,"reviews_count":26,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/11/18/OtP2wwy725yXhmng_1637231162658_0_size_1097x1097.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2021/10/22/A3JwDtHqKSrQip3z_1634907255778_1_size_856x428.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/11/18/thumb_OtP2wwy725yXhmng_1637231162658_0_size_1097x1097.jpg","last_loggedin_at":1641810320,"created_at":1629534457,"login_streak_count":143,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":true,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":0,"new_user":false}]}

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
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (conferenceCall != null) {
      map['conference_call'] = conferenceCall?.toJson();
    }
    return map;
  }
}

/// id : 48487862
/// active : true
/// conference_call_users_count : 3
/// call_type : null
/// server : "wss://webrtc-p-003.batiapps.com:8443/room"
/// mode : "call"
/// agora_channel : "yay-48487862"
/// agora_token : "00679046b8c9be54945b7f10a4d128d5395IACkQv64KVwxSl/Ab47nAFWP/cpKGRpxbCIx7lrCgtpCAt9LcLgAAAAAIgAaLCLmTV7dYQQAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAA"
/// locked : false
/// open : true
/// anonymous_call_users_count : 0
/// joinable_by : "anyone"
/// max_participants : 18
/// post_id : 241693362
/// game : null
/// conference_call_users : [{"id":4726420,"username":null,"nickname":"西村ウォン","prefecture":"","biography":"自分からフォローあんまりしません\n変人仲間→佐々木\nフォローされたら奇跡\n\n九州のどっかに住んでます🚺","followers_count":34,"followings_count":21,"gender":1,"ticket":0,"is_private":true,"title":null,"posts_count":10,"groups_users_count":0,"reviews_count":21,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/4/awrDVYkdGpfv7oR0_1641303230_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg","last_loggedin_at":1641810605,"created_at":1641298163,"login_streak_count":7,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":1,"new_user":false},{"id":4655915,"username":null,"nickname":"たなか","prefecture":"","biography":"\n\n見てんじゃねぇよ☺️\n\n ","followers_count":4,"followings_count":4,"gender":0,"ticket":0,"is_private":true,"title":null,"posts_count":3,"groups_users_count":0,"reviews_count":1,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/4qTTpVNFkpo5GLNF_1641810202_0_size_1536x1536.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/3/Gl3h27qTkTjyUA5G_1641176031_0_size_1536x768.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_4qTTpVNFkpo5GLNF_1641810202_0_size_1536x1536.jpg","last_loggedin_at":1641810276,"created_at":1640211701,"login_streak_count":10,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":false,"age_verified":false,"recently_kenta":false,"dangerous_user":false,"generation":2,"new_user":false},{"id":3935099,"username":null,"nickname":"高校生Aくん","prefecture":"兵庫県","biography":"関西\n洋楽･弾き語り好き\n僕の歌声を聞いたら\n安らかに永眠してくれるような\n歌声を目指しています\nみんな仲良くしてくれると嬉しいです！","followers_count":343,"followings_count":66,"gender":0,"ticket":0,"is_private":false,"title":null,"posts_count":38,"groups_users_count":0,"reviews_count":26,"profile_icon":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/11/18/OtP2wwy725yXhmng_1637231162658_0_size_1097x1097.jpg","cover_image":"https://yay-cdn.com/file/yay-space/uploads/user_cover/2021/10/22/A3JwDtHqKSrQip3z_1634907255778_1_size_856x428.jpg","profile_icon_thumbnail":"https://yay-cdn.com/file/yay-space/uploads/user_avatar/2021/11/18/thumb_OtP2wwy725yXhmng_1637231162658_0_size_1097x1097.jpg","last_loggedin_at":1641810320,"created_at":1629534457,"login_streak_count":143,"is_online":true,"online_status":"online","country_code":"JP","vip":false,"mobile_verified":true,"age_verified":true,"recently_kenta":false,"dangerous_user":false,"generation":0,"new_user":false}]

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
    map['game'] = game;
    if (conferenceCallUsers != null) {
      map['conference_call_users'] = conferenceCallUsers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 4726420
/// username : null
/// nickname : "西村ウォン"
/// prefecture : ""
/// biography : "自分からフォローあんまりしません\n変人仲間→佐々木\nフォローされたら奇跡\n\n九州のどっかに住んでます🚺"
/// followers_count : 34
/// followings_count : 21
/// gender : 1
/// ticket : 0
/// is_private : true
/// title : null
/// posts_count : 10
/// groups_users_count : 0
/// reviews_count : 21
/// profile_icon : "https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg"
/// cover_image : "https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/4/awrDVYkdGpfv7oR0_1641303230_0_size_1536x768.jpg"
/// profile_icon_thumbnail : "https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg"
/// last_loggedin_at : 1641810605
/// created_at : 1641298163
/// login_streak_count : 7
/// is_online : true
/// online_status : "online"
/// country_code : "JP"
/// vip : false
/// mobile_verified : false
/// age_verified : true
/// recently_kenta : false
/// dangerous_user : false
/// generation : 1
/// new_user : false

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

/// id : 4726420
/// username : null
/// nickname : "西村ウォン"
/// prefecture : ""
/// biography : "自分からフォローあんまりしません\n変人仲間→佐々木\nフォローされたら奇跡\n\n九州のどっかに住んでます🚺"
/// followers_count : 34
/// followings_count : 21
/// gender : 1
/// ticket : 0
/// is_private : true
/// title : null
/// posts_count : 10
/// groups_users_count : 0
/// reviews_count : 21
/// profile_icon : "https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg"
/// cover_image : "https://yay-cdn.com/file/yay-space/uploads/user_cover/2022/1/4/awrDVYkdGpfv7oR0_1641303230_0_size_1536x768.jpg"
/// profile_icon_thumbnail : "https://yay-cdn.com/file/yay-space/uploads/user_avatar/2022/1/10/thumb_gW1Y3pJdceAAza68_1641788009_0_size_1536x1536.jpg"
/// last_loggedin_at : 1641810605
/// created_at : 1641298163
/// login_streak_count : 7
/// is_online : true
/// online_status : "online"
/// country_code : "JP"
/// vip : false
/// mobile_verified : false
/// age_verified : true
/// recently_kenta : false
/// dangerous_user : false
/// generation : 1
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
