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

  createAccount(){

  }

  loginPressed(){
    Get.offAll(MainMenuTabletPhonePage());
  }
}