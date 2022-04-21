import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'richTextTwoDifferentWidget.dart';
import 'textWidget.dart';

class TextButtonWidget extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final double? borderRadius;
  final TextWidget? textWidget;
  final TextAlign? textAlign;
  final RichTextTwoDifferentWidget? richText;
  final Widget? widgetCustom;
  final Function()? onTap;

  const TextButtonWidget(
      { Key? key,
        this.hintText,
        this.fontSize,
        this.borderRadius,
        this.textWidget,
        this.textAlign,
        this.richText,
        this.widgetCustom,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          primary: AppColors().purpleDefaultColor,
          backgroundColor: AppColors().transparentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
        ),
        child: richText ?? (
          widgetCustom ??
          TextWidget(
            hintText ?? "",
            textColor: AppColors().purpleDefaultColor,
            fontSize: fontSize ?? 17.sp,
            fontWeight: FontWeight.bold,
            textAlign: textAlign,
          )
        ),
    );
  }
}