import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/app/feature/pages/login/controller/loginController.dart';
import 'package:newsapp/app/feature/pages/login/model/userModel.dart';



class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(label: Text("E mail")),
              onChanged: (value) {
                loginController.eMail.value = value;
              },
            ),
            TextField(
              decoration: InputDecoration(label: Text("password")),
              onChanged: (value) {
                loginController.password.value = value;
              },
            ),
            TextButton(
                onPressed: () {
                  loginController.isLogin.value = "1";
                  loginController.addUserLogin(UserLogin(
                    phoneNumber: loginController.phoneNumber.value,
                    nameSurname: loginController.nameSurname.value,
                    isLogin: loginController.isLogin.value,
                    email: loginController.eMail.value,
                    password: loginController.password.value,
                  ));
                  debugPrint(loginController.eMail.value);
                  debugPrint(loginController.password.value);
                  debugPrint(
                    loginController.isLogin.value.toString(),
                  );
                },
                child: Text("Sign In"))
          ],
        ),
      ),
    );
  }
}
