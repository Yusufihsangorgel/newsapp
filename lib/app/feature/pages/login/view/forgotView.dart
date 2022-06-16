import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:io' show Platform;

import 'package:newsapp/app/feature/pages/login/controller/loginController.dart';
import 'package:newsapp/app/feature/pages/login/view/loginView.dart';
import 'package:newsapp/app/feature/widgets/buildImage.dart';
import 'package:newsapp/app/feature/widgets/buildSnackBar.dart';
import 'package:newsapp/app/feature/widgets/buildTextFormField.dart';
import 'package:newsapp/app/feature/widgets/mySize.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const BuildImage(image: "images/logo.png"),
                const MySize(),
                Text(
                  "NEWS APP",
                  style: GoogleFonts.bebasNeue(
                      textStyle:
                          const TextStyle(fontSize: 40, color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 80),
                  child: Container(
                      color: Colors.transparent,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            BuildTextFormField(
                              changed: loginController.emailChanged,
                              text: "E Posta",
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              error: loginController.errorText.value,
                            ),
                            const MySize(),
                            ElevatedButton(
                              child: const Text("Doğrulama postası gönder"),
                              onPressed: () {
                                buildSnackBar("Başarılı!",
                                    "Doğrulama E postası başarıyla gönderildi");
                              },
                            ),
                            TextButton(
                              child: const Text("Zaten bir hesabınız var mı?"),
                              onPressed: () {
                                Get.to(LoginScreen());
                              },
                            ),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
