import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StutasController extends GetxController{
  var isDarkMode = false.obs;
  var currentT = false.obs;

  void toggleTheme(){
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }
  void changeLanguage(){
    Locale currentLang = Get.locale ?? Locale('ar');
    if(currentLang == Locale('ar')){
      Get.updateLocale(Locale('en'));
      currentT.value = !currentT.value;
    } else {
      Get.updateLocale(Locale('ar'));
      currentT.value = !currentT.value;

    }
  }
}
