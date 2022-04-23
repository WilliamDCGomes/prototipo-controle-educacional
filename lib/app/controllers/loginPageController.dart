import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../views/pages/tabletPhonePages/mainMenuTabletPhonePage.dart';

class LoginController extends GetxController {
  late TextEditingController raInputController;
  late TextEditingController passwordInputController;
  late RxBool passwordFieldEnabled;

  LoginController(){
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
  }

  loginPressed(){
    Get.offAll(MainMenuTabletPhonePage());
  }
}