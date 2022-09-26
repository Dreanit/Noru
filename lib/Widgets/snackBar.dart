import 'package:flutter/material.dart';
import 'package:get/get.dart';
snackbarGetx(
    {required String title, required String content, Color? titleColor}) {
  return Get.snackbar("", "$content".tr,
      titleText: Text(
        "$title".tr,
        style: TextStyle(
            color: titleColor ?? Colors.white,
            fontSize: (content == " ") ? 16.0 : 18.0,
            fontWeight: FontWeight.bold),
      ),
      snackPosition: SnackPosition.BOTTOM,
      padding: (content == " ")
          ? EdgeInsets.only(top: 15, left: 10)
          : EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      backgroundColor: Colors.black,
      colorText: Colors.white);
}

