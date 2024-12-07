import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odo/widget/custom_loading.dart';

class MyDialog
{
  // info
  static void info(String msg)
  {
    Get.snackbar('Info', msg, backgroundColor: Colors.blue.withOpacity(0.7),colorText: Colors.white);
  }

  //success
  static void success(String msg)
  {
    Get.snackbar('Info', msg, backgroundColor: Colors.green.withOpacity(0.7),colorText: Colors.white);
  }

  //error
  static void error(String msg)
  {
    Get.snackbar('Info', msg, backgroundColor: Colors.red.withOpacity(0.7),colorText: Colors.white);
  }
  //loading
  static void showLoadingDialog() {
    Get.dialog(const Center(child: CustomLoading()));
  }
}



