import 'package:json_annotation/json_annotation.dart';

part 'newsModel.g.dart';

@JsonSerializable()
class News {
  String? title;
  String? author;
  String? publishedDate;
  String? publishedDatePrecision;
  String? link;
  String? cleanUrl;
  String? summary;
  String? rights;
  int? rank;
  String? topic;
  String? country;
  String? language;
  List<String>? authors;
  String? media;
  bool? isOpinion;
  String? twitterAccount;
  double? dScore;
  String? sId;

  News(
      {this.title,
      this.author,
      this.publishedDate,
      this.publishedDatePrecision,
      this.link,
      this.cleanUrl,
      this.summary,
      this.rights,
      this.rank,
      this.topic,
      this.country,
      this.language,
      this.authors,
      this.media,
      this.isOpinion,
      this.twitterAccount,
      this.dScore,
      this.sId});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  News.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    cleanUrl = json['clean_url'];
    summary = json['summary'];
    media = json['media'];
    sId = json['_id'];
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['link'] = link;
    data['clean_url'] = cleanUrl;
    data['summary'] = summary;
    data['media'] = media;
    data['_id'] = sId;
    return data;
  }
}
