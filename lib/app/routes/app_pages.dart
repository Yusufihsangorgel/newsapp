import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/favorite/view/readView.dart';
import 'package:newsapp/app/feature/pages/home/view/homeView.dart';
import 'package:newsapp/app/feature/pages/login/view/loginView.dart';



part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Login;


  static final routes = [

GetPage(
      name: AppRoutes.Login,
      page: () => LoginScreen(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeView(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: AppRoutes.Favorite,
      page: () => FavoriteView(),
      transition: Transition.downToUp,
    ),
  ];

 
}
