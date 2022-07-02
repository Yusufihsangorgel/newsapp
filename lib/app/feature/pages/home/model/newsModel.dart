import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'newsModel.g.dart';

@JsonSerializable()
class News {
  String? title;
  String? author;
  DateTime? publishedDate;
  String? publishedDatePrecision;
  String? link;
  String? cleanUrl;
  String? summary;
  String? rights;
  int? rank;
  String? topic;
  String? country;
  String? language;
  String? authors;
  String? media;
  bool? isOpinion;
  String? twitterAccount;
  double? score;
  String? id;

  News({
    this.title,
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
    this.score,
    this.id,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);

  News.fromMap(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    cleanUrl = json['clean_url'];
    summary = json['summary'];
    media = json['media'];
    id = json['_id'];
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['link'] = link;
    data['clean_url'] = cleanUrl;
    data['summary'] = summary;
    data['media'] = media;
    data['_id'] = id;
    return data;
  }
}

// enum Country { IN, GB, US, NZ }

// final countryValues = EnumValues(
//     {"GB": Country.GB, "IN": Country.IN, "NZ": Country.NZ, "US": Country.US});

// enum Language { EN }

// final languageValues = EnumValues({"en": Language.EN});

// enum PublishedDatePrecision { FULL, TIMEZONE_UNKNOWN }

// final publishedDatePrecisionValues = EnumValues({
//   "full": PublishedDatePrecision.FULL,
//   "timezone unknown": PublishedDatePrecision.TIMEZONE_UNKNOWN
// });

// enum Topic { NEWS, WORLD, FINANCE, BUSINESS }

// final topicValues = EnumValues({
//   "business": Topic.BUSINESS,
//   "finance": Topic.FINANCE,
//   "news": Topic.NEWS,
//   "world": Topic.WORLD
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
