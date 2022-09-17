import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class FingerPrintSettingTabletPhoneController extends GetxController {
  late RxBool loadingAnimation;
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
    loadingAnimation = false.obs;
    saveButtonFocusNode = FocusNode();

    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  saveButtonPressed(){

  }
}