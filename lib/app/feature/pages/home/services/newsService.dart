import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/home/controller/homeController.dart';
import 'package:newsapp/app/feature/pages/home/model/newsModel.dart';

class NewsServices extends HomeController {
  static var dio = Dio();

  static Future<List<News>?> getNews() async {
    final HomeController homeController = Get.put(HomeController());
    var baseUrl = "https://free-news.p.rapidapi.com/v1/search";
    var params = {
      'q': homeController.search.value.toString(),
      'lang': homeController.lang.value.toString()
    };
    var headers = {
      "X-RapidAPI-Host": "free-news.p.rapidapi.com",
      "X-RapidAPI-Key": "8ad5d90d72msh7bf606d6993cb80p1f5a9fjsn1242d0cc7448"
    };

    try {
      print("girdi");
      var response = await dio.get(baseUrl,
          queryParameters: params, options: Options(headers: headers));
      
      final jsonResponse = response.data;
      final news = jsonResponse['articles'] as List;
      print('News Info: ${news}');
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
    return null;
  }
}
