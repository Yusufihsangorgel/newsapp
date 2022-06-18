import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/home/model/newsModel.dart';
import 'package:newsapp/app/feature/pages/home/services/newsService.dart';

class HomeController extends GetxController {
  var search = "Elon Musk".obs;
  var lang = "en".obs;
  var isLoading = true.obs;
  var isError = false.obs;

  var newsList = <News>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getNewsList() async {
    isLoading(true);
    try {
      var news = await NewsServices.getNews();
      if (news != null) {
        newsList.value = news;
        isLoading(false);
      }
    } on Exception catch (e) {
      isError(true);
      print(e);
    }
  }
}
