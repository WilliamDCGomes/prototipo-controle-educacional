import 'package:get/get.dart';
import '../../../../helpers/platform_type.dart';
import '../../tabletPhonePages/welcomePage/page/welcome_page_tablet_phone_page.dart';
import '../../watchPages/welcome_page_watch_page.dart';
import '../../webPages/welcome_page_web_page.dart';

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