// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      title: json['title'] as String?,
      author: json['author'] as String?,
      publishedDate: json['publishedDate'] as String?,
      publishedDatePrecision: json['publishedDatePrecision'] as String?,
      link: json['link'] as String?,
      cleanUrl: json['cleanUrl'] as String?,
      summary: json['summary'] as String?,
      rights: json['rights'] as String?,
      rank: json['rank'] as int?,
      topic: json['topic'] as String?,
      country: json['country'] as String?,
      language: json['language'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      media: json['media'] as String?,
      isOpinion: json['isOpinion'] as bool?,
      twitterAccount: json['twitterAccount'] as String?,
      dScore: (json['dScore'] as num?)?.toDouble(),
      sId: json['sId'] as String?,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'publishedDate': instance.publishedDate,
      'publishedDatePrecision': instance.publishedDatePrecision,
      'link': instance.link,
      'cleanUrl': instance.cleanUrl,
      'summary': instance.summary,
      'rights': instance.rights,
      'rank': instance.rank,
      'topic': instance.topic,
      'country': instance.country,
      'language': instance.language,
      'authors': instance.authors,
      'media': instance.media,
      'isOpinion': instance.isOpinion,
      'twitterAccount': instance.twitterAccount,
      'dScore': instance.dScore,
      'sId': instance.sId,
    };
