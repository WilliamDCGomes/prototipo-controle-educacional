import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/platform_type.dart';
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
    return SizedBox(
      height: PlatformType.isTablet(context) ? 15.h : 14.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextWidget(
            firstText,
            textColor: AppColors.blackColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              secondText,
              textColor: AppColors.blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              thirdText,
              textColor: AppColors.blackColor,
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