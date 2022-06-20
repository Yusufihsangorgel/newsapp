import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:newsapp/app/feature/pages/login/model/userDatabaseModel.dart';
import 'package:newsapp/app/feature/pages/login/model/userModel.dart';
import 'package:newsapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  DatabaseHelperLogin databaseHelper = DatabaseHelperLogin();
  var userList = <UserLogin>[].obs;

  var eMail = "blabla@gmail.com".obs;
  var nameSurname = "nameSurname".obs;
  var phoneNumber = "432432".obs;
  var password = "1".obs;
  var isLogin = "0".obs;
  var showPassword = true.obs;
  RxnString errorText = RxnString(null);
  var getRegister = false.obs;



  @override
  void onInit() {
    debounce<String>(eMail, validations,
        time: const Duration(milliseconds: 500));
    getUser();
    super.onInit();
  }

  Future<void> getUser() async {
    var resultUser = databaseHelper.getUsers();
    await resultUser.then((data) {
      userList.value = data;

      if (isLogin.value == "1") {
        Get.toNamed(AppRoutes.Favorite);
      }
      print("Kullanici Login Durumu ${isLogin.value}");
    });
  }

  void addUserLogin(UserLogin user) async {
    await databaseHelper.insert(user);
    print("kayıt oldu la");
  }

  void login() async {
    if (eMail.isEmpty) {
      Get.snackbar("Error", "Please Enter User ID");
    } else if (password.isEmpty) {
      Get.snackbar("Error", "Please Enter Password");
    } else {
      await databaseHelper
          .getLoginUser(eMail.value, password.value)
          .then((userData) {
        if (userData != null) {
          Get.toNamed(AppRoutes.Home);
          Get.snackbar("Success", "Giriş Başarılı");
        } else {
          Get.snackbar("Error", "User Not Found");
        }
      }).catchError((error) {
        print(error);
        Get.snackbar("Error", "Login Fail");
      });
    }
  }

  void showPasswordFunc() {
    if (showPassword.isTrue) {
      showPassword.value = false;
    } else {
      showPassword.value = true;
    }
  }

  void registerWidget() {
    if (getRegister.isFalse) {
      getRegister.value = true;
    } else {
      getRegister.value = false;
    }
  }

  void validations(String val) async {
    errorText.value = null;
    if (val.isNotEmpty) {
      if (lengthOK(val)) {
        errorText.value = null;
      }
    }
  }

  bool lengthOK(String val, {int minLen = 5}) {
    if (val.length < minLen) {
      errorText.value = 'Minimum 5 karakter';
      return false;
    }
    return true;
  }

  void emailChanged(String val) {
    eMail.value = val;
    print("güncel email : " + eMail.value);
  }

  void passwordChanged(String val) {
    password.value = val;
    print("güncel password : " + password.value);
  }

  void namesurnameChanged(String val) {
    nameSurname.value = val;
  }

  void phoneNumberChanged(String val) {
    phoneNumber.value = val;
  }
}
