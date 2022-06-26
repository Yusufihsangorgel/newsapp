import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/login/controller/loginController.dart';
import 'package:newsapp/app/feature/pages/login/model/userModel.dart';
import 'package:newsapp/app/feature/widgets/buildText.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
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
                      color: Colors.red),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: null, icon: Icon(Icons.search)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        labelText: "Anan"),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text("Selam"),
                    subtitle: Text("Merhaba"),
                    trailing: Text("huhu"),
                  );
                })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
