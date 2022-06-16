import 'package:json_annotation/json_annotation.dart';


part 'userModel.g.dart';

@JsonSerializable()
class UserLogin {
  
  late String isLogin;
  late String email;
  late String password;
  late String nameSurname;
  late String phoneNumber;
  UserLogin({required this.isLogin, required this.email, required this.password,required this.nameSurname,required this.phoneNumber});
  UserLogin.withId(this.isLogin, this.email, this.password);
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["isLogin"] = isLogin;
    map["username"] = email;
    map["password"] = password;
    return map;
  }

  UserLogin.fromMap(Map<String, dynamic> map) {
    this.isLogin = map["isLogin"];
    this.email = map["username"];
    this.password = map["password"];
    this.password = map["nameSurname"];
    this.password = map["phoneNumber"];
  }
  UserLogin.fromJson(Map<String, dynamic> json) {
    isLogin = json['isLogin'];
    email = json['username'];
    password = json['password'];
    nameSurname = json['nameSurname'];
    phoneNumber = json['phoneNumber'];
  }
}