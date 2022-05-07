import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../stylePages/appColors.dart';
import 'textWidget.dart';

class ButtonLoadingWidget extends StatelessWidget {
  final String? hintText;
  final double? heightButton;
  final double? widthButton;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  final Color? valueColor;
  final Color? successColor;
  final RoundedLoadingButtonController controller;
  final double? loaderSize;
  final double? loaderStrokeWidth;
  final Function()? onPressed;

  const ButtonLoadingWidget(
      {Key? key,
        this.hintText,
        this.heightButton,
        this.widthButton,
        this.borderRadius,
        this.textColor,
        this.onPressed,
        this.color,
        this.loaderSize,
        this.loaderStrokeWidth,
        this.valueColor,
        required this.controller,
        this.successColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      height: heightButton ?? 5.5.h,
      width: widthButton ?? 25.w,
      onPressed: onPressed,
      loaderSize: loaderSize ?? 3.h,
      loaderStrokeWidth: loaderStrokeWidth ?? 4,
      color: color ?? AppColors.whiteColor,
      successColor: successColor ?? AppColors.greenColor,
      borderRadius: borderRadius ?? 2.h,
      valueColor: valueColor ?? AppColors.whiteColor,
      controller: controller,
      child: TextWidget(
        hintText ?? "",
        textColor: textColor ?? AppColors.whiteColor,
        fontSize: 2.h,
      ),
    );
  }
}