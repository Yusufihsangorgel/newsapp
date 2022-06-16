// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => UserLogin(
      isLogin: json['isLogin'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      nameSurname: json['nameSurname'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'isLogin': instance.isLogin,
      'email': instance.email,
      'password': instance.password,
      'nameSurname': instance.nameSurname,
      'phoneNumber': instance.phoneNumber,
    };
