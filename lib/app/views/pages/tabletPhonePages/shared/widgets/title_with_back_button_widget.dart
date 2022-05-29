import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class TitleWithBackButtonWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;

  const TitleWithBackButtonWidget(
      { Key? key,
        required this.title,
        this.titleColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 2.w),
          child: TextButtonWidget(
            onTap: () => Get.back(),
            height: 8.w,
            width: 3.h,
            componentPadding: EdgeInsets.all(.5.w),
            widgetCustom: Icon(
              Icons.arrow_back_ios,
              color: AppColors.purpleDefaultColor,
              size: 3.h,
            ),
          ),
        ),
        TextWidget(
          title,
          textColor: titleColor ?? AppColors.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}