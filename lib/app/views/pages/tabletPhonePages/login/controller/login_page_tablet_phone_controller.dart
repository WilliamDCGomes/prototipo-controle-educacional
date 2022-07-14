import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../registerUser/pages/register_user_tablet_phone_page.dart';
import '../../shared/widgets/loading_tablet_phone_widget.dart';

class LoginTabletPhoneController extends GetxController {
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimation;
  late LoadingTabletPhoneWidget loadingTabletPhoneWidget;

  LoginTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){
    raInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordFieldEnabled = true.obs;
    loadingAnimation = false.obs;
    loadingTabletPhoneWidget= LoadingTabletPhoneWidget(loadingAnimetion: loadingAnimation);
  }

  forgotRa() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  forgotPassword() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  createAccount() async {
    await Future.delayed(Duration(milliseconds: 200));
    await Get.to(() => RegisterUserTabletPhonePage());
  }

  loginPressed(){
    loadingAnimation.value = true;
    loadingTabletPhoneWidget.startAnimation(destinationPage: MainMenuTabletPhonePage());
  }
}