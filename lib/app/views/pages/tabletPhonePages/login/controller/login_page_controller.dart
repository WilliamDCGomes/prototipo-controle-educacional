import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../registerUser/pages/register_user_tablet_phone_page.dart';
import '../../shared/widgets/loading_widget.dart';

class LoginController extends GetxController {
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late RxBool passwordFieldEnabled;
  late RxBool loadingAnimation;
  late LoadingWidget loadingWidget;

  LoginController(){
    _initializeVariables();
  }

  _initializeVariables(){
    raInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordFieldEnabled = true.obs;
    loadingAnimation = false.obs;
    loadingWidget= LoadingWidget(loadingAnimetion: loadingAnimation);
  }

  forgotRa() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  forgotPassword() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  createAccount() async {
    await Future.delayed(Duration(milliseconds: 200));
    await Get.to(() => RegisterUserTabletPhone());
  }

  loginPressed(){
    loadingAnimation.value = true;
    loadingWidget.iniciaAnimacao(destinationPage: MainMenuTabletPhonePage());
  }
}