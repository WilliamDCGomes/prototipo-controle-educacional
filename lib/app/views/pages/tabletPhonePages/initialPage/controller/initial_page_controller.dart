import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../utils/platform_type.dart';
import '../../../watchPages/welcome_page_watch_page.dart';
import '../../../webPages/welcome_page_web_page.dart';
import '../../mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import '../../welcomePage/page/welcome_page_tablet_phone_page.dart';

class InitialPageController extends GetxController {
  late RxBool loadingAnimationSuccess;
  late SharedPreferences sharedPreferences;
  late final LocalAuthentication fingerPrintAuth;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  InitialPageController(){
    _initializeVariables();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await Firebase.initializeApp();
    await _loadFirstScreen();
    super.onInit();
  }

  _initializeVariables(){
    loadingAnimationSuccess = false.obs;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimationSuccess,
    );
    fingerPrintAuth = LocalAuthentication();
  }

  _loadFirstScreen() async {
    await Future.delayed(Duration(seconds: 2));
    if(PlatformType.isPhone(Get.context!) || PlatformType.isTablet(Get.context!)) {
      if(await sharedPreferences.getBool("show-welcome-page-key") ?? true){
        await sharedPreferences.setBool("show-welcome-page-key", false);
        Get.offAll(() => WelcomePageTabletPhonePage());
      }
      else if(await sharedPreferences.getBool("keep-connected") ?? false){
        if(await fingerPrintAuth.canCheckBiometrics && (await sharedPreferences.getBool("always_request_finger_print") ?? false)){
          var authenticate = await fingerPrintAuth.authenticate(
            localizedReason: "Utilize a sua digital para fazer o login.",
          );

          if (authenticate) {
            loadingAnimationSuccess.value = true;

            await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(duration: 2);
            Get.offAll(() => MainMenuTabletPhonePage());
          }
          else{
            Get.offAll(() => LoginPageTabletPhone());
          }
        }
        else{
          Get.offAll(() => MainMenuTabletPhonePage());
        }
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