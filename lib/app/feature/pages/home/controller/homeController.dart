import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/home/model/newsDatabaseModel.dart';
import 'package:newsapp/app/feature/pages/home/model/newsModel.dart';
import 'package:newsapp/app/feature/pages/home/services/newsService.dart';

class HomeController extends GetxController {
  DatabaseHelperNews databaseHelper = DatabaseHelperNews();
  var search = "Elon Musk".obs;
  var lang = "tr".obs;
  var isLoading = true.obs;
  var isError = false.obs;

  var newsList = <News>[].obs;
  var favoriteNewsList = <News>[].obs;

  @override
  void onInit() {
    // getApiNewsList();
    super.onInit();
  }

  Future<void> getApiNewsList() async {
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

  void addFavoriteNews(News news) async {
    await databaseHelper.insert(news);
    print("favorilere eklendi");
  }

  void deleteFavoriteNews(News news) async {
    String? delId = news.sId;
   
    if(delId!.isEmpty){
      Get.snackbar("Error", "Id is empty");
    }
    else {
      await databaseHelper.delete(delId).then((value) {
        if(value == 1){
         Get.snackbar("Başarılı", "Başarıyla silindi");
        }
      });
    }
 
    
  }
}
