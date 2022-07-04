import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class InformationPopup extends StatelessWidget {
  final String warningMessage;
  const InformationPopup({
    Key? key,
    required this.warningMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
        child: Container(
          width: 75.w,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(1.h),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 90.w,
                padding: EdgeInsets.all(1.h),
                decoration: BoxDecoration(
                  color: AppColors.purpleDefaultColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(1.h),
                    topLeft: Radius.circular(1.h),
                  ),
                ),
                child: TextWidget(
                  "AVISO",
                  textColor: AppColors.whiteColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextWidget(
                      warningMessage,
                      textColor: AppColors.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Center(
                        child: ButtonWidget(
                          hintText: "OK",
                          heightButton: 5.h,
                          widthButton: 32.w,
                          fontWeight: FontWeight.bold,
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}