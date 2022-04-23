import 'package:get/get.dart';

class ScreenSize {
  static final ScreenSize _screenSize =
  ScreenSize._internal();
  factory ScreenSize() {
    return _screenSize;
  }
  ScreenSize._internal();

  double getStatusAndBottonBarHeight(){
    return Get.statusBarHeight + Get.bottomBarHeight;
  }

  double getScreenHeight(){
    return Get.height - Get.statusBarHeight;
  }
}