

import 'package:newsapp/app/core/database/databaseModel.dart';

class News extends  DatabaseModel<News>{
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

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    publishedDate = json['published_date'];
    publishedDatePrecision = json['published_date_precision'];
    link = json['link'];
    cleanUrl = json['clean_url'];
    summary = json['summary'];
    rights = json['rights'];
    rank = json['rank'];
    topic = json['topic'];
    country = json['country'];
    language = json['language'];
    authors = json['authors'].cast<String>();
    media = json['media'];
    isOpinion = json['is_opinion'];
    twitterAccount = json['twitter_account'];
    dScore = json['_score'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.author;
    data['published_date'] = this.publishedDate;
    data['published_date_precision'] = this.publishedDatePrecision;
    data['link'] = this.link;
    data['clean_url'] = this.cleanUrl;
    data['summary'] = this.summary;
    data['rights'] = this.rights;
    data['rank'] = this.rank;
    data['topic'] = this.topic;
    data['country'] = this.country;
    data['language'] = this.language;
    data['authors'] = this.authors;
    data['media'] = this.media;
    data['is_opinion'] = this.isOpinion;
    data['twitter_account'] = this.twitterAccount;
    data['_score'] = this.dScore;
    data['_id'] = this.sId;
    return data;
  }
  
  @override
  News fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}

