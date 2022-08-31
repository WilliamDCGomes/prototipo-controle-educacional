import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/mainMenu/page/main_menu_tablet_phone_page.dart';
import '../../../../../../base/models/registration_cancellation.dart';
import '../../../../../../base/services/interfaces/irequest_registration_cancellation_service.dart';
import '../../../../../../base/services/request_registration_cancellation_service.dart';
import '../../shared/popups/confirmation_tablet_phone_popup.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class RequestRegistrationCancellationTabletPhoneController extends GetxController {
  late bool registrationCancellationExist;
  late RxBool loadingAnimation;
  late RxBool inputOtherReasonVisible;
  late accountCancelation? reasonOfCancelation;
  late TextEditingController otherReason;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late RegistrationCancellation _registrationCancellation;
  late IRequestRegistrationCancellationService _requestRegistrationCancellationService;

  RequestRegistrationCancellationTabletPhoneController(this.registrationCancellationExist){
    _initializeVariables();
    _setRegistrationCancellationInformations();
  }

  _initializeVariables(){
    loadingAnimation = false.obs;
    inputOtherReasonVisible = false.obs;
    reasonOfCancelation = accountCancelation.financialIssues;
    otherReason = TextEditingController();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    _registrationCancellation = RegistrationCancellation();
    _requestRegistrationCancellationService = RequestRegistrationCancellationService();
  }

  _setRegistrationCancellationInformations(){
    _registrationCancellation.ra = LoggedUser.ra;
    _registrationCancellation.cpf = LoggedUser.cpf;
    _registrationCancellation.courseId = LoggedUser.courseId;
    _registrationCancellation.educationInstitutionId = LoggedUser.educationInstitutionId;
  }

  getRegistrationCancellation() async {
    var cancellationRequest = await _requestRegistrationCancellationService.getRegistrationCancellation(LoggedUser.cpf);
    if(cancellationRequest != null){
      _registrationCancellation = cancellationRequest;
      reasonOfCancelation = accountCancelation.values[_registrationCancellation.reasonCancellation];

      if(reasonOfCancelation! == accountCancelation.others) {
        otherReason.text = _registrationCancellation.otherReasonCancellation;
        inputOtherReasonVisible.value = true;
      }
    }
  }

  bool _checkReasonCancellation(){
    if(inputOtherReasonVisible.value && otherReason.text == "") {
      return false;
    }
    return true;
  }

  buttonDeleteRegistrationCancellationPressed() async {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return ConfirmationTabletPhonePopup(
          title: "Aviso",
          subTitle: "Deseja realmente excluir a solicitação de cancelamento?",
          buttonYes: () => _deleteRegistrationCancellation(),
          buttonNo: (){},
        );
      },
    );
  }

  _deleteRegistrationCancellation() async {
    try{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(milliseconds: 500));

      bool request = await _requestRegistrationCancellationService.deleteRegistrationCancellation(LoggedUser.cpf);

      if(request){
        await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation();
        await showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "Cancelamento de Matrícula Excluido com Sucesso!",
            );
          },
        );
        await Get.offAll(() => MainMenuTabletPhonePage());
      }
      else{
        throw Exception();
      }
    }
    catch(_){
      loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Ocorreu um erro durante o processo.\nTente novamente mais tarde!",
          );
        },
      );
    }
  }

  buttonCancelRegistrationPressed() async {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return ConfirmationTabletPhonePopup(
          title: "Aviso",
          subTitle: "Deseja realmente solicitar o cancelamento de matrícula?",
          buttonYes: () => _requestRegistrationCancellation(),
          buttonNo: (){},
        );
      },
    );
  }

  _requestRegistrationCancellation() async {
    try{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(milliseconds: 500));

      if(_checkReasonCancellation()){
        _registrationCancellation.reasonCancellation = reasonOfCancelation!.index;
        if(inputOtherReasonVisible.value) {
          _registrationCancellation.otherReasonCancellation = otherReason.text;
        }
        bool request = await _requestRegistrationCancellationService.requestRegistrationCancellation(_registrationCancellation);

        if(request){
          await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation();
          await showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return InformationTabletPhonePopup(
                warningMessage: "Cancelamento de Matrícula Solicitado com Sucesso!\n\n"
                    "Você ainda pode utilizar sua conta até que o cancelamento "
                    "seja realizado pela instituição.",
              );
            },
          );
          await Get.offAll(() => MainMenuTabletPhonePage());
        }
        else{
          throw Exception();
        }
      }
      else {
        loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return InformationTabletPhonePopup(
              warningMessage: "Informe o motivo do cancelamento da matrícula",
            );
          },
        );
      }
    }
    catch(_){
      loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Ocorreu um erro durante a solicitação de cancelamento.\nTente novamente mais tarde!",
          );
        },
      );
    }
  }
}