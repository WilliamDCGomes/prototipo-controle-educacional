import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../stylePages/appColors.dart';
import '../textWidget.dart';

class ButtonWidget extends StatelessWidget {
  final String? hintText;
  final double? heightButton;
  final double? widthButton;
  final double? radioButton;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onPressed;

  const ButtonWidget(
      { Key? key,
        this.hintText,
        this.heightButton,
        this.widthButton,
        this.radioButton,
        this.fontWeight,
        this.backgroundColor,
        this.textColor,
        this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton ?? 6.h,
      width: widthButton ?? 25.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            backgroundColor ?? AppColors().whiteColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radioButton ?? 5.h),
            ),
          ),
        ),
        child: TextWidget(
          hintText ?? "",
          textColor: textColor ?? AppColors().whiteColor,
          fontSize: MediaQuery.of(context).orientation == Orientation.portrait ?
          16.sp : 13.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}