import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'textWidget.dart';

class TextButtonWidget extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final TextWidget? textWidget;
  final RichText? richText;
  final Function()? onTap;

  const TextButtonWidget(
      { Key? key,
        this.hintText,
        this.fontSize,
        this.textWidget,
        this.richText,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          primary: AppColors().purpleDefaultColor,
          backgroundColor: AppColors().transparentColor,
        ),
        child: richText ?? TextWidget(
          hintText ?? "",
          textColor: AppColors().purpleDefaultColor,
          fontSize: fontSize ?? 17.sp,
          fontWeight: FontWeight.bold,
        ),
    );
  }
}