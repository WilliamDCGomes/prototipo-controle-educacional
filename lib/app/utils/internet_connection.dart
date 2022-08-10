import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/pages/tabletPhonePages/shared/popups/information_tablet_phone_popup.dart';
import '../views/pages/tabletPhonePages/shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class InternetConnection {
  static Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<bool> validInternet(String errorMessage, RxBool loadingAnimation, LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget) async {
    try {
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(seconds: 1));

      final result = await InternetAddress.lookup('google.com');
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      throw Exception();
    }
    catch (_) {
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      await showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: errorMessage,
          );
        },
      );
      return false;
    }
  }
}