import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:projeto_tcc/base/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../../../../utils/internet_connection.dart';
import '../../mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../registerUser/pages/register_user_tablet_phone_page.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_tablet_phone_widget.dart';

class LoginTabletPhoneController extends GetxController {
  late RxBool raInputHasError;
  late RxBool passwordInputHasError;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimation;
  late RxBool keepConected;
  late LoadingTabletPhoneWidget loadingTabletPhoneWidget;
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late FocusNode passwordInputFocusNode;
  late FocusNode loginButtonFocusNode;
  late SharedPreferences sharedPreferences;
  late IUserService userService;
  late final GlobalKey<FormState> formKey;

  LoginTabletPhoneController(){
    _initializeVariables();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await _getKeepConnected();
    await _getRaId();
    super.onInit();
  }

  _getKeepConnected() async {
    keepConected.value = await sharedPreferences.getBool("keep-connected") ?? false;
  }

  _getRaId() async {
    var ra = await sharedPreferences.getInt("ra_student_logged");
    if(ra != null) {
      raInputController.text = ra.toString();
    }
  }

  _initializeVariables(){
    raInputHasError = false.obs;
    passwordInputHasError = false.obs;
    passwordFieldEnabled = true.obs;
    loadingAnimation = false.obs;
    keepConected = false.obs;
    formKey = GlobalKey<FormState>();
    loadingTabletPhoneWidget= LoadingTabletPhoneWidget(loadingAnimation: loadingAnimation);
    raInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordInputFocusNode = FocusNode();
    loginButtonFocusNode = FocusNode();
    userService = UserService();
    if (kDebugMode){
      raInputController.text = "1000";
      passwordInputController.text = "47122223";
    }
  }

  createAccount() async {
    await Get.to(() => RegisterUserTabletPhonePage());
  }

  loginPressed() async {
    if(formKey.currentState!.validate()){
      loginButtonFocusNode.requestFocus();
      if(!await InternetConnection.checkConnection()){
        await showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "É necessário uma conexão com a internet para fazer o login",
            );
          },
        );
        return;
      }
      loadingAnimation.value = true;
      await loadingTabletPhoneWidget.startAnimation();

      await Future.delayed(Duration(seconds: 1));
      bool logged = await userService.loginUser(
        raInputController.text,
        passwordInputController.text,
      );

      await loadingTabletPhoneWidget.stopAnimation(justLoading: true);

      if(logged){
        int? oldRa = await sharedPreferences.getInt("ra_student_logged");
        if(oldRa == null){
          await sharedPreferences.setInt("ra_student_logged", int.parse(raInputController.text));
        }
        else if(oldRa != int.parse(raInputController.text)){
          await sharedPreferences.clear();
          await sharedPreferences.setBool("show-welcome-page-key", false);
          await sharedPreferences.setInt("ra_student_logged", int.parse(raInputController.text));
        }

        if(keepConected.value){
          await sharedPreferences.setBool("keep-connected", true);
        }
        else{
          await sharedPreferences.setBool("keep-connected", false);
        }

        Get.offAll(() => MainMenuTabletPhonePage());
      }
      else{
        await showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "O Ra ou a Senha estão incorreto.",
            );
          },
        );
      }
    }
  }
}

