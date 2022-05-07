import 'package:get/get.dart';

class ScreenSize {
  static double getStatusAndBottonBarHeight(){
    return Get.statusBarHeight + Get.bottomBarHeight;
  }

  static double getScreenHeight(){
    return Get.height - Get.statusBarHeight;
  }
}