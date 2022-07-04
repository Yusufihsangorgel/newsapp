import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController snackbar(String title, String description, Color? color) {
  return Get.snackbar(
    title,
    description,
    snackPosition: SnackPosition.TOP,
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    colorText: color ?? const Color(0xffF36F21),
    backgroundColor: Colors.black,
    margin: const EdgeInsets.all(15),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
