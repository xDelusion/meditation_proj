class TipsModel {
  TipsModel({
    required this.tipsData,
  });
  late final List<TipsData> tipsData;

  TipsModel.fromJson(Map<String, dynamic> json) {
    tipsData =
        List.from(json['data']).map((e) => TipsData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = tipsData.map((e) => e.toJson()).toList();

    return _data;
  }
}

class TipsData {
  int id;
  String text;
  String author;
  List<dynamic> upvotes;
  List<dynamic> downvotes;
  late final List<TipsData> data;
  TipsData(
      {required this.id,
      required this.text,
      required this.author,
      required this.upvotes,
      required this.downvotes});

  factory TipsData.fromJson(Map<String, dynamic> json) {
    return TipsData(
        id: json['id'] as int,
        text: json['text'] as String,
        author: json['author'] as String,
        upvotes: List<dynamic>.from(json['upvotes'] as List<dynamic>),
        downvotes: List<dynamic>.from(json['downvotes'] as List<dynamic>));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['text'] = text;
    _data['author'] = author;
    _data['upvotes'] = upvotes;
    _data['downvotes'] = downvotes;
    return _data;
  }
}
