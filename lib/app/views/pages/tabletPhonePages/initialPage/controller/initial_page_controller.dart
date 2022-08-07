import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../utils/platform_type.dart';
import '../../../watchPages/welcome_page_watch_page.dart';
import '../../../webPages/welcome_page_web_page.dart';
import '../../welcomePage/page/welcome_page_tablet_phone_page.dart';

class InitialPageController extends GetxController {
  late SharedPreferences sharedPreferences;

  InitialPageController();

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await Firebase.initializeApp();
    await _loadFirstScreen();
    super.onInit();
  }

  _loadFirstScreen() async {
    await Future.delayed(Duration(seconds: 2));
    if(PlatformType.isPhone(Get.context!) || PlatformType.isTablet(Get.context!)) {
      if(sharedPreferences.getBool("show-welcome-page-key") ?? true){
        await sharedPreferences.setBool("show-welcome-page-key", false);
        Get.offAll(() => WelcomePageTabletPhonePage());
      }
      else{
        Get.offAll(() => LoginPageTabletPhone());
      }
    }
    else if(PlatformType.isWeb()) {
      Get.offAll(() => WelcomePageWebPage());
    }
    else if(PlatformType.isWatch(Get.context!)) {
      Get.offAll(() => WelcomePageWatchPage());
    }
  }
}