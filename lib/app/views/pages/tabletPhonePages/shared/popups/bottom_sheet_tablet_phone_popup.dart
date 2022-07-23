import 'dart:ui';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class BottomSheetTabletPhonePopup {
  static showAlert(BuildContext context, List<Widget> bottomSheetBody, double initHeight){
    showFlexibleBottomSheet(
      bottomSheetColor: AppColors.whiteColor,
      minHeight: 0,
      initHeight: initHeight,
      maxHeight: 1,
      context: context,
      builder: (context, scrollControlle, bottomSheerOffser){
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: AppColors.whiteColor,
            padding: EdgeInsets.all(2.h),
            child: ListView(
              controller: scrollControlle,
              shrinkWrap: true,
              children: bottomSheetBody,
            ),
          ),
        );
      },
      anchors: [0, 0.5, 1],
      isSafeArea: true,
    );
  }
}