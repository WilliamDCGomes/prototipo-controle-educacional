import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/rich_text_two_different_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../stylePages/app_colors.dart';

class TextButtonWidget extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final double? borderRadius;
  final double? height;
  final double? width;
  final TextWidget? textWidget;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Alignment? componentAlignment;
  final EdgeInsets? componentPadding;
  final FontWeight? fontWeight;
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
        this.textDecoration,
        this.textAlign,
        this.componentAlignment,
        this.componentPadding,
        this.fontWeight,
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
            foregroundColor: AppColors.purpleDefaultColor,
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
              fontWeight: fontWeight ?? FontWeight.bold,
              textAlign: textAlign,
              textDecoration: textDecoration,
            )
          ),
      ),
    );
  }
}