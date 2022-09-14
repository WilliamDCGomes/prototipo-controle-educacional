import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/base/services/user_service.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../login/page/login_page_tablet_phone_page.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class ForgotInformationTabletPhoneController extends GetxController {
  late TextEditingController emailInputController;
  late RxBool loadingAnimation;
  late RxBool emailInputHasError;
  late final GlobalKey<FormState> formKey;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late IUserService _userService;

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
    _userService = UserService();
  }

  sendButtonPressed() async {
    try{
      if(formKey.currentState!.validate()){
        loadingAnimation.value = true;
        await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
        if(await _userService.resetPassword(emailInputController.text)){
          await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation();
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
        throw Exception();
      }
    }
    catch(_){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Erro durante a recuperação!\nTente novamente mais tarde.",
          );
        },
      );
    }
  }
}