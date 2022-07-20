import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class HeaderRegisterStepperTabletPhoneWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;

  const HeaderRegisterStepperTabletPhoneWidget(
      { Key? key,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        color: AppColors.purpleDefaultColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextWidget(
            firstText,
            textColor: AppColors.whiteColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              secondText,
              textColor: AppColors.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              thirdText,
              textColor: AppColors.whiteColor,
              fontSize: 15.sp,
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}