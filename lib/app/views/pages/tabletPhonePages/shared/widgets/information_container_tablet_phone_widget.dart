import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../utils/platform_type.dart';
import '../../../widgetsShared/text_widget.dart';

class InformationContainerTabletPhoneWidget extends StatelessWidget {
  final Widget? customContainer;
  final EdgeInsets? marginContainer;
  final EdgeInsets? marginIcon;
  final EdgeInsets? padding;
  final String iconPath;
  final String informationText;
  final Color textColor;
  final Color backgroundColor;

  const InformationContainerTabletPhoneWidget(
      { Key? key,
        this.customContainer,
        this.marginContainer,
        this.marginIcon,
        this.padding,
        required this.iconPath,
        required this.informationText,
        required this.textColor,
        required this.backgroundColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: marginContainer ?? EdgeInsets.only(
            left: 2.h,
            top: PlatformType.isTablet(context) ? 9.h : 7.h,
            right: 2.h,
            bottom: 2.h,
          ),
          padding: padding ?? EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 3.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.h),
            color: backgroundColor,
          ),
          child: customContainer ?? TextWidget(
            informationText,
            textColor: textColor,
            fontSize: 18.sp,
            textAlign: TextAlign.center,
            maxLines: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.all(2.h),
            margin: marginIcon ?? EdgeInsets.only(
              top: PlatformType.isTablet(context) ? 4.h : 2.h,
              right: 1.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.5.h),
              color: backgroundColor,
            ),
            child: Image.asset(
              iconPath,
              height: 5.h,
              width: 5.h,
            ),
          ),
        ),
      ],
    );
  }
}