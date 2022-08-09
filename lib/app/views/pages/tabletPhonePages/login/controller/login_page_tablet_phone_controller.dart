import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../registerUser/pages/register_user_tablet_phone_page.dart';
import '../../shared/widgets/loading_tablet_phone_widget.dart';

class LoginTabletPhoneController extends GetxController {
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late RxBool raInputHasError;
  late RxBool passwordInputHasError;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimation;
  late final GlobalKey<FormState> formKey;
  late LoadingTabletPhoneWidget loadingTabletPhoneWidget;

  LoginTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){
    raInputController = TextEditingController();
    passwordInputController = TextEditingController();
    raInputHasError = false.obs;
    passwordInputHasError = false.obs;
    passwordFieldEnabled = true.obs;
    loadingAnimation = false.obs;
    formKey = GlobalKey<FormState>();
    loadingTabletPhoneWidget= LoadingTabletPhoneWidget(loadingAnimetion: loadingAnimation);
  }

  createAccount() async {
    await Get.to(() => RegisterUserTabletPhonePage());
  }

  loginPressed() {
    if(formKey.currentState!.validate()){
      loadingAnimation.value = true;
      loadingTabletPhoneWidget.startAnimation(destinationPage: MainMenuTabletPhonePage());
    }
  }
}

