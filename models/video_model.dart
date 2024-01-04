import 'dart:convert';

class Video {
  final String id; // 唯一标识
  final String videoName; // 名称
  final String? coverUrl; //封面url
  final Map<String, String>? coverHeaders; //封面headers
  final String? detailPageUrl;
  final String? actors; // 演员
  final String? introduce; //介绍
  final List<String>? tags; // 类型列表
  final DateTime? latestUpdate; //最新更新时间
  late final Map<String, dynamic> extra;

  Video({
    required this.id,
    required this.videoName,
    this.coverUrl,
    this.coverHeaders,
    this.detailPageUrl,
    this.actors,
    this.introduce,
    this.tags,
    this.latestUpdate,
    extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map<String, dynamic> data) {
    return Video(
      id: data['id'] as String,
      videoName: data['videoName'] as String,
      coverUrl: data['coverUrl'] as String?,
      coverHeaders: data['coverHeaders']?.map<String, String>((k, v) {
        return MapEntry(k as String, v as String);
      }) as Map<String, String>?,
      detailPageUrl: data['detailPageUrl'] as String?,
      actors: data['actors'] as String?,
      introduce: data['introduce'] as String?,
      tags: data['tags']?.map<String>((e) => e.toString()).toList() as List<String>?,
      latestUpdate: data['latestUpdate'] == null ? null : DateTime.tryParse(data['latestUpdate']),
      extra: data['extra'],
    );
  }

  toJson() {
    return {
      "id": id,
      "videoName": videoName,
      "coverUrl": coverUrl,
      "coverHeaders": coverHeaders,
      'detailPageUrl': detailPageUrl,
      "actors": actors,
      "introduce": introduce,
      "tags": tags,
      "latestUpdate": latestUpdate != null ? latestUpdate.toString() : latestUpdate,
      "extra": extra,
    };
  }
}

class ResultVideos {
  final List<Video> videos;
  final int currPage;
  final int totalPage;

  ResultVideos({
    required this.videos,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultVideos(
        videos: (data['videos'] as List).map<Video>((e) => Video.fromJson(e)).toList(),
        currPage: data['currPage'] as int,
        totalPage: data['totalPage'] as int);
  }

  toJson() {
    return {
      'videos': videos.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}

class Episode {
  // 集
  final String name;
  final String url;
  final Map<String, String>? headers;
  final String? audioTrack;

  Episode({
    required this.name,
    required this.url,
    this.headers,
    this.audioTrack,
  });

  static fromJson(Map<String, dynamic> data) {
    return Episode(
      name: data['name'] as String,
      url: data['url'] as String,
      headers: data['headers']?.map<String, String>((k, v) {
        return MapEntry(k as String, v as String);
      }) as Map<String, String>?,
      audioTrack: data['audioTrack'] as String?,
    );
  }

  toJson() {
    return {
      'name': name,
      'url': url,
      'headers': headers,
      'audioTrack': audioTrack,
    };
  }
}

class Season {
  // 季
  final String seasonName;
  final String? seasonUrl;
  final List<Episode> episodes;

  Season({required this.seasonName, this.seasonUrl, required this.episodes});

  static fromJson(Map<String, dynamic> data) {
    return Season(
      seasonName: data['seasonName'] as String,
      seasonUrl: data['seasonUrl'] as String?,
      episodes: ((data['episodes'] as List?) ?? []).map<Episode>((e) {
        return Episode.fromJson(e);
      }).toList(),
    );
  }

  toJson() {
    return {
      'seasonName': seasonName,
      'seasonUrl': seasonUrl,
      'episodes': episodes.map((e) => e.toJson()).toList(),
    };
  }
}

class VideoDetail {
  // video的详情
  final List<Season> seasons; // 所有季
  final String? actors; // 演员
  final String? introduce; //介绍
  final List<String>? tags; // 类型列表
  final DateTime? latestUpdate; //最新更新时间
  late final Map<String, dynamic> extra;

  VideoDetail({
    required this.seasons,
    this.actors,
    this.introduce,
    this.tags,
    this.latestUpdate,
    extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map<String, dynamic> data) {
    return VideoDetail(
      seasons: (data['seasons'] as List).map<Season>((e) => Season.fromJson(e)).toList(),
      actors: data['actors'] as String?,
      introduce: data['introduce'] as String?,
      tags: data['tags']?.map<String>((e) => e.toString()).toList() as List<String>?,
      latestUpdate: data['latestUpdate'] == null ? null : DateTime.tryParse(data['latestUpdate']),
      extra: data['extra'],
    );
  }

  toJson() {
    return {
      'seasons': seasons.map((e) => e.toJson()).toList(),
      "actors": actors,
      "introduce": introduce,
      "tags": tags,
      "latestUpdate": latestUpdate?.toString(),
      "extra": extra,
    };
  }
}
