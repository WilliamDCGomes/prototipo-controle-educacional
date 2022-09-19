import 'package:get/get.dart';
import 'package:flutter/material.dart';
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
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;

  FingerPrintSettingTabletPhoneController(){
    _initializeVariables();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
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
  }

  fingerPrintLoginPressed(){
    fingerPrintLoginChecked.value = !fingerPrintLoginChecked.value;
    if(!fingerPrintLoginChecked.value){
      alwaysRequestFingerPrintChecked.value = false;
      enableAlwaysRequestFingerPrint.value = true;
      print("sdsdds");
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

  saveButtonPressed(){

  }
}