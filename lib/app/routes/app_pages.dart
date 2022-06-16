import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/home/view/homeView.dart';
import 'package:newsapp/app/feature/pages/login/view/loginView.dart';
import 'package:newsapp/app/feature/pages/read/view/readView.dart';


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
      name: AppRoutes.Read,
      page: () => ReadView(),
      transition: Transition.downToUp,
    ),
  ];

 
}
