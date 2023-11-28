import 'dart:convert';

class Music {
  final String id; //唯一标志
  final String musicName; //音乐名称
  final String singer; //歌手名称
  late final List<String> quality; //可选音质
  final String? coverUrl; //封面地址
  final Map<String, String>? coverHeaders; //封面headers

  final String? photoUrl; // cover要比photo尺寸小
  final Map<String, String>? photoHeaders; //照片headers
  late final Map<String, dynamic> extra; //额外信息

  Music({
    required this.id,
    required this.musicName,
    required this.singer,
    List<String>? quality,
    this.coverUrl,
    this.coverHeaders,
    this.photoUrl,
    this.photoHeaders,
    Map<String, dynamic>? extra,
  }) {
    this.quality = quality ?? [];
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map data) {
    return Music(
      id: data['id'] as String,
      musicName: data['musicName'] as String,
      singer: data['singer'] as String,
      quality: data['quality'] as List<String>?,
      coverUrl: data['coverUrl'] as String?,
      coverHeaders:
          data['coverHeaders']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
              as Map<String, String>?,
      photoUrl: data['photoUrl'] as String?,
      photoHeaders:
          data['photoHeaders']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
              as Map<String, String>?,
      extra: data['extra']?.map<String, dynamic>((k, v) => MapEntry(k as String, v as dynamic))
          as Map<String, dynamic>?,
    );
  }

  toJson() {
    return {
      'id': id,
      'musicName': musicName,
      'singer': singer,
      'coverUrl': coverUrl,
      'coverHeaders': coverHeaders,
      'photoUrl': photoUrl,
      'photoHeaders': photoHeaders,
      'extra': extra,
    };
  }
}

///歌单
class Playlist {
  final String id;
  final String name;
  final String? coverUrl;
  final Map<String, String>? coverHeaders;
  final String? creator;
  final String? createAt;
  final String? introduce;
  final int? numMusics;
  late final Map<String, dynamic> extra;

  Playlist({
    required this.id,
    required this.name, //名称
    this.coverUrl, //封面链接
    this.coverHeaders, //封面headers
    this.creator, //创建者
    this.createAt,
    this.introduce,
    this.numMusics,
    extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(data) {
    return Playlist(
      id: data['id'] as String,
      name: data['name'] as String,
      coverUrl: data['coverUrl'] as String?,
      coverHeaders:
          data['coverHeaders']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
              as Map<String, String>?,
      creator: data['creator'] as String?,
      createAt: data['createAt'] as String?,
      introduce: data['introduce'] as String?,
      numMusics: data['numMusics'] as int?,
      extra: data['extra']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
          as Map<String, String>?,
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'coverUrl': coverUrl,
      'coverHeaders': coverHeaders,
      'creator': creator,
      'createAt': createAt,
      'introduce': introduce,
      'numMusics': numMusics,
      'extra': extra,
    };
  }
}

class Comment {
  final String userName; //用户名
  final String content; //评论内容
  final String? image; // 部分源支持带图片评论
  final String? createTime; //创建时间
  final String? photoUrl; //头像地址
  final Map<String, String>? photoHeaders; //头像headers
  final int? thumbUp; //点赞数
  late final List<Comment> replies; //对此评论的回复

  Comment({
    required this.userName,
    required this.content,
    this.image,
    this.createTime,
    this.photoUrl,
    this.photoHeaders,
    this.thumbUp,
    replies,
  }) {
    this.replies = replies ?? [];
  }

  static Comment fromJson(Map<String, dynamic> data) {
    return Comment(
      userName: (data['userName'] ?? '') as String,
      content: data['content'] as String,
      image: data['image'] as String?,
      createTime: data['createTime'] as String?,
      photoUrl: data['photoUrl'] as String?,
      photoHeaders:
          data['photoHeaders']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
              as Map<String, String>?,
      thumbUp: data['thumbUp'] as int?,
      replies: (data['replies'] ?? []).map<Comment>((c) => Comment.fromJson(c)).toList(),
    );
  }

  toJson() {
    return {
      'userName': userName,
      'content': content,
      'createTime': createTime,
      'photoUrl': photoUrl,
      'photoHeaders': photoHeaders,
      'thumbUp': thumbUp,
      'replies': replies.map((e) => e.toJson()).toList(),
    };
  }
}

class ResultComments {
  final List<Comment> comments;
  final int currPage;
  final int totalPage;

  ResultComments({
    required this.comments,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultComments(
      comments: (data['comments'] as List).map<Comment>((e) => Comment.fromJson(e)).toList(),
      currPage: data['currPage'] as int,
      totalPage: data['totalPage'] as int,
    );
  }

  toJson() {
    return {
      'comments': comments.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}

/// 音乐的搜索结果
class ResultMusics {
  final List<Music> musics;
  final int currPage;
  final int totalPage;

  ResultMusics({
    required this.musics,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultMusics(
      musics: (data['musics'] as List).map<Music>((e) => Music.fromJson(e)).toList(),
      currPage: data['currPage'] as int,
      totalPage: data['totalPage'] as int,
    );
  }

  toJson() {
    return {
      'musics': musics.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}

///相册的搜索结果
class ResultPlaylists {
  final List<Playlist> playlists;
  final int currPage;
  final int totalPage;

  ResultPlaylists({
    required this.playlists,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultPlaylists(
      playlists: (data['playlists'] as List).map<Playlist>((e) => Playlist.fromJson(e)).toList(),
      currPage: data['currPage'] as int,
      totalPage: data['totalPage'] as int,
    );
  }

  toJson() {
    return {
      'playlists': playlists.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}
