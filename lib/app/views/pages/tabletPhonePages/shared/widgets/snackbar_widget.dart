import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class SnackbarWidget {
  final String informationText;
  SnackbarWidget({
    required this.informationText,
  }) {
    mostraSnackBar(informationText);
  }

  void mostraSnackBar(String informationText) => Get.snackbar(
    '',
    '',
    titleText: TextWidget(
      "Aviso",
      textColor: AppColors.whiteColor,
      fontSize: 14.sp,
      textAlign: TextAlign.center,
      maxLines: 1,
      fontWeight: FontWeight.bold,
    ),
    messageText: TextWidget(
      informationText,
      textColor: AppColors.whiteColor,
      fontSize: 14.sp,
      textAlign: TextAlign.center,
      maxLines: 1,
      fontWeight: FontWeight.bold,
    ),
    duration: const Duration(seconds: 2),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.purpleDefaultColorWithOpacity,
    margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
  );
}