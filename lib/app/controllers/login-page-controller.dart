import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../views/pages/tablet-phone-pages/main-menu-tablet-phone-page.dart';
import '../views/pages/tablet-phone-pages/register-user-tablet-phone-page.dart';

class LoginController extends GetxController {
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late RxBool passwordFieldEnabled;

  LoginController(){
    _initializeVariables();
  }

  _initializeVariables(){
    raInputController = TextEditingController();
    passwordInputController = TextEditingController();
    passwordFieldEnabled = true.obs;
  }

  forgotRa() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  forgotPassword() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  createAccount() async {
    await Future.delayed(Duration(milliseconds: 200));
    await Get.to(RegisterUserTabletPhone());
  }

  loginPressed(){
    Get.offAll(MainMenuTabletPhonePage());
  }
}