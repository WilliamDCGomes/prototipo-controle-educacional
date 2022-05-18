import 'package:get/get.dart';
import '../helpers/platform_type.dart';
import '../views/pages/tabletPhonePages/welcome_page_tablet_phone_page.dart';
import '../views/pages/watchPages/welcome_page_watch_page.dart';
import '../views/pages/webPages/welcome_page_web_page.dart';

class InitialPageController extends GetxController {
  InitialPageController();

  loadFirstScreen(context){
    //Configurar para que possa ir direto a tela de menu iniciar
    if(PlatformType.isPhone(context) || PlatformType.isTablet(context))
      Get.offAll(() => WelcomePageTabletPhonePage());
    else if(PlatformType.isWeb())
      Get.offAll(() => WelcomePageWebPage());
    else if(PlatformType.isWatch(context))
      Get.offAll(() => WelcomePageWatchPage());
  }
}