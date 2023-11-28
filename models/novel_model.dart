import 'dart:convert';

class Novel {
  final String id;
  final String name; //书名
  final String? author; //作者
  final String? coverUrl; //封面地址
  final Map<String, String>? coverHeaders; //封面headers
  final String? size; //大小或字数
  final DateTime? latestUpdate; //最近更新时间
  final List<String>? tags; // 标签
  final String? introduce; //介绍
  final String? readingChapterId; //正在阅读的章节的id
  final DateTime? readingDatetime; // 最新阅读时间
  late final Map<String, dynamic> extra;

  Novel({
    required this.id,
    required this.name,
    required this.author,
    this.coverUrl,
    this.coverHeaders,
    this.size,
    this.latestUpdate,
    this.tags,
    this.introduce,
    this.readingChapterId,
    this.readingDatetime,
    extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map<String, dynamic> data) {
    return Novel(
      id: data['id'] as String,
      name: data['name'] as String,
      author: data['author'] as String?,
      coverUrl: data['coverUrl'] as String?,
      coverHeaders:
          data['coverHeaders']?.map<String, String>((k, v) => MapEntry(k as String, v as String))
              as Map<String, String>?,
      size: data['size'] as String?,
      latestUpdate: data['latestUpdate'] == null ? null : DateTime.tryParse(data['latestUpdate']),
      tags: data['tags'] as List<String>?,
      introduce: data['introduce'] as String?,
      readingChapterId: data['readingChapterId'] as String?,
      readingDatetime:
          data['readingDatetime'] == null ? null : DateTime.tryParse(data['readingDatetime']),
      extra: data['extra'],
    );
  }

  toJson() {
    return {
      "id": id,
      "name": name,
      "author": author,
      "coverUrl": coverUrl,
      "coverHeaders": coverHeaders,
      "size": size,
      "latestUpdate": latestUpdate != null ? latestUpdate.toString() : latestUpdate,
      "tags": tags,
      "introduce": introduce,
      "readingChapterId": readingChapterId,
      "readingDatetime": readingDatetime != null ? readingDatetime.toString() : readingDatetime,
      "extra": extra,
    };
  }
}

/// 小说的搜索结果
class ResultNovels {
  final List<Novel> novels;
  final int currPage;
  final int totalPage;

  ResultNovels({
    required this.novels,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultNovels(
        novels: (data['novels'] as List).map<Novel>((e) => Novel.fromJson(e)).toList(),
        currPage: data['currPage'] as int,
        totalPage: data['totalPage'] as int);
  }

  toJson() {
    return {
      'novel': novels.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}

class NovelChapter {
  final String id;
  final String chapterName;
  final String? chapterUrl;
  late final Map<String, dynamic> extra;

  NovelChapter({
    required this.id,
    required this.chapterName,
    this.chapterUrl,
    extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map<String, dynamic> data) {
    return NovelChapter(
      id: data['id'] as String,
      chapterName: data['chapterName'] as String,
      chapterUrl: data['chapterUrl'] as String?,
      extra: data['extra'],
    );
  }

  toJson() {
    return {
      'id': id,
      'chapterName': chapterName,
      'chapterUrl': chapterUrl,
      'extra': extra,
    };
  }
}

class ResultChapters {
  final List<NovelChapter> chapters;
  final String? introduce;
  final String? author;
  final DateTime? latestUpdate; //最近更新时间
  final List<String>? tags; // 标签
  final String? size; //大小或字数
  late final Map<String, dynamic> extra;

  ResultChapters({
    required this.chapters,
    this.introduce,
    this.author,
    this.latestUpdate,
    this.tags,
    this.size,
    extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map<String, dynamic> data) {
    return ResultChapters(
      chapters:
          (data['chapters'] as List).map<NovelChapter>((e) => NovelChapter.fromJson(e)).toList(),
      introduce: data['introduce'] as String,
      author: data['author'] as String,
      latestUpdate: data['latestUpdate'] == null ? null : DateTime.tryParse(data['latestUpdate']),
      //最近更新时间
      tags: data['tags'] as List<String>?,
      // 标签
      size: data['size'] as String?,
      //大小或字数
      extra: data['extra'],
    );
  }

  toJson() {
    return {
      'chapters': chapters.map((e) => e.toJson()).toList(),
      'introduce': introduce,
      'author': author,
      'latestUpdate': latestUpdate,
      'tags': tags,
      'size': size,
      'extra': extra,
    };
  }
}
