import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController buildSnackBar(String title, subTitle) {
  return Get.snackbar(title, subTitle,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      icon: const Icon(Icons.info));
}
