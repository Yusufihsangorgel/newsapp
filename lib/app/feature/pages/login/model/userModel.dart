import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserLogin {
  String? isLogin;
  String? email;
  String? password;
  String? nameSurname;
  String? phoneNumber;
  UserLogin(
      {required this.isLogin,
      required this.email,
      required this.password,
      required this.nameSurname,
      required this.phoneNumber});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["isLogin"] = isLogin;
    map["username"] = email;
    map["password"] = password;
    map["nameSurname"] = nameSurname;
    map["phoneNumber"] = phoneNumber;

    return map;
  }

  UserLogin.fromMap(Map<String, dynamic> map) {
    isLogin = map["isLogin"];
    email = map["username"];
    password = map["password"];
    nameSurname = map["nameSurname"];
    phoneNumber = map["phoneNumber"];
  }
  UserLogin.fromJson(Map<String, dynamic> json) {
    isLogin = json['isLogin'];
    email = json['username'];
    password = json['password'];
    nameSurname = json['nameSurname'];
    phoneNumber = json['phoneNumber'];
  }
}
