import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app/feature/pages/login/controller/loginController.dart';
import 'package:newsapp/app/feature/pages/login/model/userModel.dart';
import 'package:newsapp/app/feature/pages/login/view/forgotView.dart';
import 'package:newsapp/app/feature/widgets/buildTextFormField.dart';
import 'package:newsapp/app/feature/widgets/mySize.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
            backgroundColor: Colors.blue,
            body: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildImage(),
                    const SizedBox(
                      height: 30,
                    ),
                    buildWelcomeText(),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 80),
                      child: Container(
                          color: Colors.transparent,
                          child: Container(
                            decoration: buildContainerDecoration(),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                if (loginController.getRegister.isTrue)
                                  BuildTextFormField(
                                    changed: loginController.namesurnameChanged,
                                    obscureBool:
                                        loginController.showPassword.value,
                                    text: "İsim Soyisim",
                                    prefixIcon: const Icon(
                                      Icons.people,
                                      color: Colors.black,
                                    ),
                                  ),
                                const MySize(),
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
                                BuildTextFormField(
                                  text: "Şifre",
                                  changed: loginController.passwordChanged,
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                      color: Colors.black,
                                      onPressed: () {
                                        loginController.showPasswordFunc();
                                      },
                                      icon: loginController.showPassword.isTrue
                                          ? const Icon(
                                              Icons.remove_red_eye_sharp)
                                          : const Icon(Icons.visibility_off)),
                                ),
                                const MySize(),
                                if (loginController.getRegister.isTrue)
                                  BuildTextFormField(
                                    text: "Telefon Numarası",
                                    changed: loginController.phoneNumberChanged,
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                  ),
                                if (loginController.getRegister.isFalse)
                                  TextButton(
                                    child: const Text("Şifremi Unuttum"),
                                    onPressed: () {
                                      Get.to(ForgotScreen());
                                    },
                                  ),
                                ElevatedButton(
                                  child: loginController.getRegister.isFalse
                                      ? const Text("Giriş yap")
                                      : const Text("Kayıt Ol"),
                                  onPressed: () {
                                    if (loginController.getRegister.isFalse) {
                                      loginController.getUser();
                                    } else if (loginController
                                        .getRegister.isTrue) {
                                      loginController.isLogin.value == "1";
                                      loginController.addUserLogin(UserLogin(
                                          isLogin:
                                              loginController.isLogin.value,
                                          email: loginController.eMail.value,
                                          password:
                                              loginController.password.value,
                                          nameSurname:
                                              loginController.nameSurname.value,
                                          phoneNumber: loginController
                                              .phoneNumber.value));
                                    }
                                  },
                                ),
                                TextButton(
                                  child: loginController.getRegister.isFalse
                                      ? const Text("Kayıt Ol")
                                      : const Text(
                                          "Zaten bir hesabınız var mı?"),
                                  onPressed: () {
                                    loginController.registerWidget();
                                    debugPrint(loginController.getRegister.value
                                        .toString());
                                  },
                                ),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  BoxDecoration buildContainerDecoration() {
    return const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
        bottomLeft: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
      ),
    );
  }

  Text buildWelcomeText() {
    return Text(
      "HOŞ GELDİNİZ",
      style: GoogleFonts.bebasNeue(
          textStyle: const TextStyle(fontSize: 40, color: Colors.white)),
    );
  }

  Image buildImage() {
    return Image.asset(
      "images/logo.png",
      height: 300,
      fit: BoxFit.cover,
    );
  }
}
