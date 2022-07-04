import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/home/controller/homeController.dart';
import 'package:newsapp/app/feature/widgets/buildNewsCart.dart';
import 'package:newsapp/app/feature/widgets/buildText.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getApiNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => RefreshIndicator(
      onRefresh: homeController.getApiNewsList,
      child: Container(
        color: Colors.blue,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildText("News"),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: Get.height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueGrey),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: null, icon: Icon(Icons.search)),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          labelText: "Search News"),
                    ),
                  ),
                ),
                if (homeController.isLoading.isTrue)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (homeController.isLoading.isFalse)
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: homeController.newsList.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 15),
                              child: NewsCard(homeController.newsList[index]));
                        })),
                  ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
