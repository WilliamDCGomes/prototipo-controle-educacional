import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/welcomePageTabletPhonePage.dart';
import 'package:projeto_tcc/app/views/pages/watchPages/welcomePageWatchPage.dart';
import 'package:projeto_tcc/app/views/pages/webPages/welcomePageWebPage.dart';
import '../helpers/platformType.dart';

class InitialPageController extends GetxController {
  InitialPageController();

  loadFirstScreen(context){
    //Configurar para que possa ir direto a tela de menu iniciar
    if(PlatformType().isPhone(context) || PlatformType().isTablet(context))
      Get.to(() => WelcomePageTabletPhonePage());
    else if(PlatformType().isWeb())
      Get.to(() => WelcomePageWebPage());
    else if(PlatformType().isWatch(context))
      Get.to(() => WelcomePageWatchPage());
  }
}