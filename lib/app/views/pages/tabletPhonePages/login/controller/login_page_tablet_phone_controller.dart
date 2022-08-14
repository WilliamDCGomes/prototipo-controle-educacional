import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/services/user_service.dart';
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
  late final GlobalKey<FormState> formKey;
  late LoadingTabletPhoneWidget loadingTabletPhoneWidget;
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late FocusNode passwordInputFocusNode;
  late FocusNode loginButtonFocusNode;
  late IUserService userService;

  LoginTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){
    raInputHasError = false.obs;
    passwordInputHasError = false.obs;
    passwordFieldEnabled = true.obs;
    loadingAnimation = false.obs;
    formKey = GlobalKey<FormState>();
    loadingTabletPhoneWidget= LoadingTabletPhoneWidget(loadingAnimation: loadingAnimation);
    raInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordInputFocusNode = FocusNode();
    loginButtonFocusNode = FocusNode();
    userService = UserService();
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

