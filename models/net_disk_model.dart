import 'dart:convert';

class NetDiskSource {
  final String id; //id
  final String title; //标题
  final String detailUrl; //详情页地址
  final String? introduce; //介绍
  final List<String>? imageList; //介绍图片url列表
  final List<String>? tags; // 类型列表
  final String? datetime; //发布时间
  final int? readNum; //阅读量
  final int? commentNum; //评论量
  final int? thumbNum; //点赞量
  late final Map<String, dynamic> extra; //额外信息

  NetDiskSource({
    required this.id,
    required this.title,
    required this.detailUrl,
    this.introduce,
    this.imageList,
    this.tags,
    this.datetime,
    this.readNum,
    this.commentNum,
    this.thumbNum,
    Map<String, dynamic>? extra,
  }) {
    this.extra = (extra?.map<String, dynamic>((k, v) => MapEntry(k.toString(), v))) ?? {};
  }

  static fromJson(Map data) {
    return NetDiskSource(
      id: data['id'] as String,
      title: data['title'] as String,
      detailUrl: data['detailUrl'] as String,
      introduce: data['introduce'] as String?,
      imageList: data['imageList']?.map<String>((e) => e.toString()).toList() as List<String>?,
      tags: data['tags']?.map<String>((e) => e.toString()).toList() as List<String>?,
      datetime: data['datetime'] as String?,
      readNum: data['readNum'] as int?,
      commentNum: data['commentNum'] as int?,
      thumbNum: data['thumbNum'] as int?,
      extra: data['extra']?.map<String, dynamic>((k, v) => MapEntry(k as String, v as dynamic))
          as Map<String, dynamic>?,
    );
  }

  toJson() {
    return {
      'id': id,
      'title': title,
      'detailUrl': detailUrl,
      'introduce': introduce,
      'imageList': imageList,
      'tags': tags,
      'datetime': datetime,
      'readNum': readNum,
      'commentNum': commentNum,
      'thumbNum': thumbNum,
      'extra': extra,
    };
  }
}

class ResultNetDiskSources {
  final List<NetDiskSource> sources;
  final int currPage;
  final int totalPage;

  ResultNetDiskSources({
    required this.sources,
    required this.currPage,
    required this.totalPage,
  });

  static fromJson(Map<String, dynamic> data) {
    return ResultNetDiskSources(
        sources:
            (data['sources'] as List).map<NetDiskSource>((e) => NetDiskSource.fromJson(e)).toList(),
        currPage: data['currPage'] as int,
        totalPage: data['totalPage'] as int);
  }

  toJson() {
    return {
      'sources': sources.map((e) => e.toJson()).toList(),
      'currPage': currPage,
      'totalPage': totalPage,
    };
  }
}
