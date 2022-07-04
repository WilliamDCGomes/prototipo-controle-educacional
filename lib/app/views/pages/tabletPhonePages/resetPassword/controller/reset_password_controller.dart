import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';
import '../../shared/popups/information_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_widget.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController oldPasswordInput;
  late TextEditingController newPasswordInput;
  late TextEditingController confirmNewPasswordInput;
  late RxBool oldPasswordVisible;
  late RxBool newPasswordVisible;
  late RxBool confirmNewPasswordVisible;
  late RxBool loadingAnimetion;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;

  ResetPasswordController(){
    _initializeVariables();
  }

  _initializeVariables(){
    oldPasswordInput = TextEditingController();
    newPasswordInput = TextEditingController();
    confirmNewPasswordInput = TextEditingController();
    oldPasswordVisible = true.obs;
    newPasswordVisible = true.obs;
    confirmNewPasswordVisible = true.obs;
    loadingAnimetion = false.obs;
    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget(
      loadingAnimetion: loadingAnimetion,
    );
  }

  resetPasswordButtonPressed() async {
    loadingAnimetion.value = true;
    await loadingWithSuccessOrErrorWidget.startAnimation();
    await Future.delayed(Duration(milliseconds: 500));
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return InformationPopup(
          warningMessage: "Senha alterada com sucesso!\nNecessário refazer o login.",
        );
      },
    );
    await Get.offAll(() => LoginPageTabletPhone());
  }
}