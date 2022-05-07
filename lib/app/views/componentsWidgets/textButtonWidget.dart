import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'richTextTwoDifferentWidget.dart';
import 'textWidget.dart';

class TextButtonWidget extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final double? borderRadius;
  final double? height;
  final double? width;
  final TextWidget? textWidget;
  final TextAlign? textAlign;
  final Alignment? componentAlignment;
  final EdgeInsets? componentPadding;
  final Size? maximumSize;
  final RichTextTwoDifferentWidget? richText;
  final Widget? widgetCustom;
  final Function()? onTap;

  const TextButtonWidget(
      { Key? key,
        this.hintText,
        this.fontSize,
        this.borderRadius,
        this.height,
        this.width,
        this.textWidget,
        this.textAlign,
        this.componentAlignment,
        this.componentPadding,
        this.maximumSize,
        this.richText,
        this.widgetCustom,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
            primary: AppColors.purpleDefaultColor,
            backgroundColor: AppColors.transparentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
            ),
            alignment: componentAlignment,
            padding: componentPadding,
            maximumSize: maximumSize,
          ),
          child: richText ?? (
            widgetCustom ??
            TextWidget(
              hintText ?? "",
              textColor: AppColors.purpleDefaultColor,
              fontSize: fontSize ?? 17.sp,
              fontWeight: FontWeight.bold,
              textAlign: textAlign,
            )
          ),
      ),
    );
  }
}