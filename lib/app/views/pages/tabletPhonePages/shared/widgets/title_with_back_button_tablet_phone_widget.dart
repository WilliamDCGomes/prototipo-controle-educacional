import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class TitleWithBackButtonTabletPhoneWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Function()? backButtonPressedFuctionOverride;

  const TitleWithBackButtonTabletPhoneWidget(
      { Key? key,
        required this.title,
        this.titleColor,
        this.backButtonPressedFuctionOverride,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      child: TextButtonWidget(
        onTap: backButtonPressedFuctionOverride != null ? backButtonPressedFuctionOverride : () => Get.back(),
        componentPadding: EdgeInsets.symmetric(vertical: .5.w),
        widgetCustom: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 2.w),
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.purpleDefaultColor,
                size: 3.h,
              ),
            ),
            Expanded(
              child: TextWidget(
                title,
                textColor: titleColor ?? AppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}