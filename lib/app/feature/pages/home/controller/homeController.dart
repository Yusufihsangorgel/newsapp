import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/home/model/newsDatabaseModel.dart';
import 'package:newsapp/app/feature/pages/home/model/newsModel.dart';
import 'package:newsapp/app/feature/pages/home/services/newsService.dart';

class HomeController extends GetxController {
  DatabaseHelperNews databaseHelper = DatabaseHelperNews();
  var search = "Elon Musk".obs;
  var lang = "en".obs;
  var isLoading = true.obs;
  var isError = false.obs;


  var newsList = <News>[].obs;
  var favoriteNewsList = <News>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void getApiNewsList() async {
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


Future<void> getDbNewsList() async {
    var resultUser = databaseHelper.getNewsDb();
    await resultUser.then((data) {
      favoriteNewsList.value = data;

        print("Favori News Listesi ${favoriteNewsList}");
    });
  }



}
