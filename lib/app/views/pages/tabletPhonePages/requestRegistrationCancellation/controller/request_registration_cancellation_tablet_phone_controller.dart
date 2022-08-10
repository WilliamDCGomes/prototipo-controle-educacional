import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class RequestRegistrationCancellationTabletPhoneController extends GetxController {
  late RxBool loadingAnimation;
  late RxBool inputOtherReasonVisible;
  late accountCancelation? reasonOfCancelation;
  late TextEditingController otherReason;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  RequestRegistrationCancellationTabletPhoneController(){
    _initializeVariables();
  }

  _initializeVariables(){
    loadingAnimation = false.obs;
    inputOtherReasonVisible = false.obs;
    reasonOfCancelation = accountCancelation.financialIssues;
    otherReason = TextEditingController();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  buttonCancelRegistrationPressed() async {
    loadingAnimation.value = true;
    await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
    await Future.delayed(Duration(milliseconds: 500));
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return InformationTabletPhonePopup(
          warningMessage: "Cancelamento de Matrícula Solicitado com Sucesso!\n\n"
              "Você ainda pode utilizar sua conta até que o cancelamento seja "
              "realizado pela instituição.",
        );
      },
    );
    await Get.offAll(() => MainMenuTabletPhonePage());
  }
}