import 'dart:convert';

class Picture {
  final String url;
  final Map<String, String>? headers;
  final int? width;
  final int? height;
  final String? size; // 3.5M
  final List<String>? tags;

  Picture({
    required this.url,
    this.headers,
    this.width,
    this.height,
    this.size,
    this.tags,
  });

  static fromJson(Map<String, dynamic> data) {
    return Picture(
        url: data['url'] as String,
        headers: data['headers']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
            as Map<String, String>?,
        width: data['width'] as int?,
        height: data['height'] as int?,
        size: data['size'] as String?,
        tags: data['tags'] as List<String>?);
  }

  toJson() {
    return {
      'url': url,
      'headers': headers,
      'width': width,
      'height': height,
      'size': size,
      'tags': tags,
    };
  }
}

/// 单个相册的属性
class Album {
  final String id;
  final String? name;
  final String? coverUrl;
  final Map<String, String>? coverHeaders;
  final List<String>? tags;
  final String? title;
  final String? description;
  final String? creator;
  final String? createAt;
  final String? detailPageUrl;
  late final Map<String, dynamic> extra;

  Album({
    required this.id,
    this.name,
    this.coverUrl,
    this.coverHeaders,
    this.tags,
    this.title,
    this.description,
    this.creator,
    this.createAt,
    this.detailPageUrl,
    extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map<String, dynamic> data) {
    return Album(
      id: data['id'] as String,
      name: data['name'] as String?,
      coverUrl: data['coverUrl'] as String?,
      coverHeaders:
          data['coverHeaders']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
              as Map<String, String>?,
      tags: data['tags'] as List<String>?,
      title: data['title'] as String?,
      description: data['description'] as String?,
      creator: data['creator'] as String?,
      createAt: data['createAt'] as String?,
      detailPageUrl: data['detailPageUrl'] as String?,
      extra: data['extra'],
    );
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'coverUrl': coverUrl,
      'coverHeaders': coverHeaders,
      'tags': tags,
      'title': title,
      'description': description,
      'creator': creator,
      'createAt': createAt,
      'detailPageUrl': detailPageUrl,
      'extra': extra,
    };
  }
}

/// 图片的搜索结果
class ResultPictures {
  final List<Picture> pictures;
  final int currPage;
  final int totalPage;

  ResultPictures({
    required this.pictures,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultPictures(
      pictures: (data['pictures'] as List).map<Picture>((e) => Picture.fromJson(e)).toList(),
      currPage: data['currPage'] as int,
      totalPage: data['totalPage'] as int,
    );
  }

  toJson() {
    return {
      'pictures': pictures.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}

///相册的搜索结果
class ResultAlbums {
  final List<Album> albums;
  final int currPage;
  final int totalPage;

  ResultAlbums({
    required this.albums,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultAlbums(
      albums: (data['albums'] as List).map<Album>((e) => Album.fromJson(e)).toList(),
      currPage: data['currPage'] as int,
      totalPage: data['totalPage'] as int,
    );
  }

  toJson() {
    return {
      'albums': albums.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}
