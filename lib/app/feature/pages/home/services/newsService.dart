import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:newsapp/app/feature/pages/home/model/newsModel.dart';

class NewsServices {
  static var dio = Dio();

  static Future<List<News>?> getNews() async {
    var baseUrl = "https://free-news.p.rapidapi.com/v1/search";
    var params = <String, String>{'q': "Elon Musk", 'lang': "en"};
    var headers = {
      "x-rapidapi-host": "8ad5d90d72msh7bf606d6993cb80p1f5a9fjsn1242d0cc7448",
      "x-rapidapi-key": "free-news.p.rapidapi.com"
    };
    var response = await dio.get("https://free-news.p.rapidapi.com/v1/search",
        queryParameters: <String, String>{'q': "Elon Musk", 'lang': "en"},
        options: Options(headers: {
          "x-rapidapi-host":
              "8ad5d90d72msh7bf606d6993cb80p1f5a9fjsn1242d0cc7448",
          "x-rapidapi-key": "free-news.p.rapidapi.com"
        }));

    try {
      var response = await dio.get(baseUrl,
          queryParameters: params, options: Options(headers: headers));
      print('News Info: ${response.data}');
      final jsonResponse = response.data;
      final news = jsonResponse['articles'] as List;
      return news.map((e) => News.fromJson(e)).toList();
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
