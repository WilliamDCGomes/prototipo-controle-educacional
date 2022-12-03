import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../stylePages/app_colors.dart';
import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String? hintText;
  final double? heightButton;
  final double? widthButton;
  final double? radioButton;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final Function()? onPressed;

  const ButtonWidget(
      { Key? key,
        this.hintText,
        this.heightButton,
        this.widthButton,
        this.radioButton,
        this.fontWeight,
        this.backgroundColor,
        this.borderColor,
        this.textColor,
        this.focusNode,
        this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightButton ?? 6.h,
      width: widthButton ?? 25.w,
      child: ElevatedButton(
        onPressed: onPressed,
        focusNode: focusNode,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: backgroundColor ?? AppColors.backgroundButtonColor,
          side: BorderSide(
            width: .25.h,
            color: borderColor ?? AppColors.backgroundButtonColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radioButton ?? 1.h),
          ),
        ),
        child: TextWidget(
          hintText ?? "",
          textColor: textColor ?? AppColors.whiteColor,
          fontSize: MediaQuery.of(context).orientation == Orientation.portrait ?
          16.sp : 13.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}