import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../stylePages/app_colors.dart';

class BottomSheetPopup {
  static showAlert(BuildContext context, List<Widget> bottomSheetBody){
    showFlexibleBottomSheet(
      bottomSheetColor: AppColors.whiteColor,
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      context: context,
      builder: (context, scrollControlle, bottomSheerOffser){
        return Material(
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