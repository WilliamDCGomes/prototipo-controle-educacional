import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../stylePages/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomSheetTabletPhonePopup {
  static showAlert(BuildContext context, List<Widget> bottomSheetBody){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context){
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: AppColors.whiteColor,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(2.h),
              physics: const NeverScrollableScrollPhysics(),
              children: bottomSheetBody,
            ),
          ),
        );
      },
    );
  }
}