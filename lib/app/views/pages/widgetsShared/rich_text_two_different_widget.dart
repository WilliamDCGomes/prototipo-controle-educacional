import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../stylePages/app_colors.dart';

class RichTextTwoDifferentWidget extends StatelessWidget {
  final int? maxLines;
  final String? firstText;
  final String? secondText;
  final double? firstTextSize;
  final double? secondTextSize;
  final Color? firstTextColor;
  final Color? secondTextColor;
  final FontWeight? firstTextFontWeight;
  final FontWeight? secondTextFontWeight;
  final TextOverflow? textOverflow;
  final TextDecoration? firstTextDecoration;
  final TextDecoration? secondTextDecoration;

  const RichTextTwoDifferentWidget(
      { Key? key,
        this.maxLines,
        this.firstText,
        this.secondText,
        this.firstTextSize,
        this.secondTextSize,
        this.firstTextColor,
        this.secondTextColor,
        this.firstTextFontWeight,
        this.secondTextFontWeight,
        this.textOverflow,
        this.firstTextDecoration,
        this.secondTextDecoration,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: TextStyle(
              color: firstTextColor ?? AppColors.orangeColor,
              fontSize: firstTextSize ?? 17.sp,
              fontWeight: firstTextFontWeight ?? FontWeight.bold,
              decoration: firstTextDecoration,
              overflow: textOverflow ?? TextOverflow.ellipsis,
            ),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: secondTextColor ?? AppColors.purpleDefaultColor,
              fontSize: secondTextSize ?? 16.sp,
              fontWeight: secondTextFontWeight ?? FontWeight.normal,
              decoration: secondTextDecoration ?? TextDecoration.underline,
              overflow: textOverflow ?? TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}