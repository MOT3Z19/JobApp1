import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusController extends GetxController{
  var isDarkMode = false.obs;
  var currentT = false.obs;


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

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme(){
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
