import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:projeto_tcc/base/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../../../../utils/internet_connection.dart';
import '../../mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../registerUser/pages/register_user_tablet_phone_page.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_tablet_phone_widget.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class LoginTabletPhoneController extends GetxController {
  late bool _cancelFingerPrint;
  late RxBool raInputHasError;
  late RxBool passwordInputHasError;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimation;
  late RxBool loadingAnimationSuccess;
  late RxBool keepConected;
  late LoadingTabletPhoneWidget loadingTabletPhoneWidget;
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late FocusNode passwordInputFocusNode;
  late FocusNode loginButtonFocusNode;
  late SharedPreferences sharedPreferences;
  late IUserService userService;
  late final LocalAuthentication fingerPrintAuth;
  late final GlobalKey<FormState> formKey;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late IUserService _userService;

  LoginTabletPhoneController(this._cancelFingerPrint){
    _initializeVariables();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await _getKeepConnected();
    await _getRaId();
    if(!_cancelFingerPrint){
      await _checkBiometricSensor();
    }
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
    loadingAnimationSuccess = false.obs;
    keepConected = false.obs;
    formKey = GlobalKey<FormState>();
    loadingTabletPhoneWidget= LoadingTabletPhoneWidget(loadingAnimation: loadingAnimation);
    raInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordInputFocusNode = FocusNode();
    loginButtonFocusNode = FocusNode();
    fingerPrintAuth = LocalAuthentication();
    userService = UserService();
    if (kDebugMode){
      raInputController.text = "1000";
      passwordInputController.text = "47122223";
    }
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimationSuccess,
    );
    _userService = UserService();
  }

  createAccount() async {
    await Get.to(() => RegisterUserTabletPhonePage());
  }

  _checkBiometricSensor() async {
    try {
      bool? useFingerPrint = await sharedPreferences.getBool("user_finger_print");
      if(await fingerPrintAuth.canCheckBiometrics && (useFingerPrint ?? false)){
        var authenticate = await fingerPrintAuth.authenticate(
          localizedReason: "Utilize a sua digital para fazer o login.",
        );

        if (authenticate) {
          loadingAnimationSuccess.value = true;
          await _saveOptions();

          await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(duration: 2);
          Get.offAll(() => MainMenuTabletPhonePage());
        }
      }
    }
    catch(e){

    }
  }

  loginPressed() async {
    try{
      if(formKey.currentState!.validate()){
        loadingAnimation.value = true;
        await loadingTabletPhoneWidget.startAnimation();
        loginButtonFocusNode.requestFocus();
        if(!await InternetConnection.checkConnection()){
          await loadingTabletPhoneWidget.stopAnimation(justLoading: true);
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

        String userCpf = await _userService.getCpf(int.parse(raInputController.text));

        String userEmail = await _userService.getEmail(userCpf);

        bool logged = await userService.loginUser(
          userEmail,
          passwordInputController.text,
        );

        await loadingTabletPhoneWidget.stopAnimation(justLoading: true);

        if(logged){
          await _saveOptions();

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
    catch(_){
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Erro ao fazer Login!\nTente novamente mais tarde.",
          );
        },
      );
    }
  }

  _saveOptions() async {
    int? oldRa = await sharedPreferences.getInt("ra_student_logged");
    if(oldRa == null){
      await sharedPreferences.setInt("ra_student_logged", int.parse(raInputController.text));
    }
    else if(oldRa != int.parse(raInputController.text)){
      await sharedPreferences.clear();
      await sharedPreferences.setBool("show-welcome-page-key", false);
      await sharedPreferences.setInt("ra_student_logged", int.parse(raInputController.text));
    }

    await sharedPreferences.setBool("keep-connected", keepConected.value);
  }
}

