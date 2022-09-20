import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class FingerPrintSettingTabletPhoneController extends GetxController {
  late RxBool loadingAnimation;
  late RxBool fingerPrintLoginChecked;
  late RxBool alwaysRequestFingerPrintChecked;
  late RxBool enableAlwaysRequestFingerPrint;
  late RxBool fingerPrintPaymentChecked;
  late RxBool fingerPrintRegistrationCancellationChecked;
  late FocusNode saveButtonFocusNode;
  late SharedPreferences sharedPreferences;
  late final LocalAuthentication fingerPrintAuth;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  FingerPrintSettingTabletPhoneController(){
    _initializeVariables();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    await _getSettingsFingerPrint();
    super.onInit();
  }

  _initializeVariables(){
    fingerPrintLoginChecked = false.obs;
    alwaysRequestFingerPrintChecked = false.obs;
    enableAlwaysRequestFingerPrint = true.obs;
    fingerPrintPaymentChecked = false.obs;
    fingerPrintRegistrationCancellationChecked = false.obs;
    loadingAnimation = false.obs;
    saveButtonFocusNode = FocusNode();

    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    fingerPrintAuth = LocalAuthentication();
  }

  _getSettingsFingerPrint() async {
    fingerPrintLoginChecked.value = await sharedPreferences.getBool("user_finger_print") ?? false;
    alwaysRequestFingerPrintChecked.value = await sharedPreferences.getBool("always_request_finger_print") ?? false;
    fingerPrintPaymentChecked.value = await sharedPreferences.getBool("finger_print_available_payment") ?? false;
    fingerPrintRegistrationCancellationChecked.value = await sharedPreferences.getBool("finger_print_for_registration_cancellation") ?? false;

    enableAlwaysRequestFingerPrint.value = !fingerPrintLoginChecked.value;
  }

  fingerPrintLoginPressed(){
    fingerPrintLoginChecked.value = !fingerPrintLoginChecked.value;
    if(!fingerPrintLoginChecked.value){
      alwaysRequestFingerPrintChecked.value = false;
      enableAlwaysRequestFingerPrint.value = true;
    }
    else{
      enableAlwaysRequestFingerPrint.value = false;
    }
  }

  alwaysRequestFingerPrintPressed(){
    alwaysRequestFingerPrintChecked.value = !alwaysRequestFingerPrintChecked.value;
  }

  fingerPrintPaymentPressed(){
    fingerPrintPaymentChecked.value = !fingerPrintPaymentChecked.value;
  }

  fingerPrintRegistrationCancellationPressed(){
    fingerPrintRegistrationCancellationChecked.value = !fingerPrintRegistrationCancellationChecked.value;
  }

  _checkFingerPrint() async {
    if(await fingerPrintAuth.canCheckBiometrics){
      var authenticate = await fingerPrintAuth.authenticate(
        localizedReason: "Utilize a sua digital para salvar as configurações.",
      );

      if (authenticate) {
        return true;
      }
      return false;
    }
    return true;
  }

  saveButtonPressed() async {
    try{
      if(await _checkFingerPrint()){
        loadingAnimation.value = true;
        await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
        await sharedPreferences.setBool("user_finger_print", fingerPrintLoginChecked.value);
        await sharedPreferences.setBool("always_request_finger_print", alwaysRequestFingerPrintChecked.value);
        await sharedPreferences.setBool("finger_print_available_payment", fingerPrintPaymentChecked.value);
        await sharedPreferences.setBool("finger_print_for_registration_cancellation", fingerPrintRegistrationCancellationChecked.value);

        await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation();
        Get.back();
      }
    }
    catch(_){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
    }
  }
}