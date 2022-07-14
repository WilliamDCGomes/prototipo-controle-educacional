import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_widget.dart';

class SnackbarTabletPhoneWidget {
  final String warningText;
  final String informationText;
  final Color backgrondColor;

  SnackbarTabletPhoneWidget({
    required this.warningText,
    required this.informationText,
    required this.backgrondColor,
  }) {
    mostraSnackBar(informationText);
  }

  void mostraSnackBar(String informationText) => Get.snackbar(
    '',
    '',
    titleText: TextWidget(
      warningText,
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
    backgroundColor: backgrondColor,
    margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
  );
}