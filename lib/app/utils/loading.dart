import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/pages/tabletPhonePages/shared/widgets/loading_tablet_phone_widget.dart';
import '../views/pages/tabletPhonePages/shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class Loading{
  static Future startAndPauseLoading(Function action, RxBool loadingAnimation, LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget) async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    loadingAnimation.value = true;
    await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();

    await Future.delayed(Duration(seconds: 1));
    await action();

    await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
  }

  static Future starAnimationAndCallOtherPage(
      Function action,
      RxBool loadingAnimation,
      LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget,
      Widget destinationPage,
  ) async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    loadingAnimation.value = true;
    await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();

    await Future.delayed(Duration(seconds: 1));
    await action();

    await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(
      destinationPage: destinationPage
    );
  }

  static Future startAndPauseLoadingLogin(Function action, RxBool loadingAnimation, LoadingTabletPhoneWidget loadingTabletPhoneWidget) async {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    loadingAnimation.value = true;
    await loadingTabletPhoneWidget.startAnimation();

    await Future.delayed(Duration(seconds: 1));
    await action();

    await loadingTabletPhoneWidget.stopAnimation(justLoading: true);
  }
}