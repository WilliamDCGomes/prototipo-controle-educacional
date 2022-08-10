import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../login/page/login_page_tablet_phone_page.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class ForgotInformationTabletPhoneController extends GetxController {
  late TextEditingController emailInputController;
  late RxBool loadingAnimation;
  late RxBool emailInputHasError;
  late final GlobalKey<FormState> formKey;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  ForgotInformationTabletPhoneController(){
    _inicializeVariables();
  }

  _inicializeVariables(){
    emailInputController = TextEditingController();
    loadingAnimation = false.obs;
    emailInputHasError = false.obs;
    formKey = GlobalKey<FormState>();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  sendButtonPressed() async {
    if(formKey.currentState!.validate()){
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(milliseconds: 500));
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Enviamos em seu E-mail as instruções para recuperar sua conta.",
          );
        },
      );
      await Get.offAll(() => LoginPageTabletPhone());
    }
  }
}