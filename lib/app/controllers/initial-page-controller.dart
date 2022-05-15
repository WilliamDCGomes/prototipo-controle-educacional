import 'package:get/get.dart';
import '../helpers/platform-type.dart';
import '../views/pages/tablet-phone-pages/welcome-page-tablet-phone-page.dart';
import '../views/pages/watch-pages/welcome-page-watch-page.dart';
import '../views/pages/web-pages/welcome-page-web-page.dart';

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