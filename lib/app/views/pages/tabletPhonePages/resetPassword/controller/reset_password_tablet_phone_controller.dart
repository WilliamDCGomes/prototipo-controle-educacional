import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class ResetPasswordTabletPhoneController extends GetxController {
  late TextEditingController oldPasswordInput;
  late TextEditingController newPasswordInput;
  late TextEditingController confirmNewPasswordInput;
  late RxBool oldPasswordVisible;
  late RxBool newPasswordVisible;
  late RxBool confirmNewPasswordVisible;
  late RxBool loadingAnimation;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  ResetPasswordTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){
    oldPasswordInput = TextEditingController();
    newPasswordInput = TextEditingController();
    confirmNewPasswordInput = TextEditingController();
    oldPasswordVisible = true.obs;
    newPasswordVisible = true.obs;
    confirmNewPasswordVisible = true.obs;
    loadingAnimation = false.obs;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  resetPasswordButtonPressed() async {
    loadingAnimation.value = true;
    await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
    await Future.delayed(Duration(milliseconds: 500));
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return InformationTabletPhonePopup(
          warningMessage: "Senha alterada com sucesso!\nNecessário refazer o login.",
        );
      },
    );
    await Get.offAll(() => LoginPageTabletPhone());
  }
}