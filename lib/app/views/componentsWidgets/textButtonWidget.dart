import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'textWidget.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final Function()? onTap;

  const TextFieldWidget(
      { Key? key,
        this.hintText,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          primary: AppColors().purpleDefaultColor,
          backgroundColor: AppColors().backgroundFirstScreenColor,
        ),
        child: TextWidget(
          hintText ?? "",
          textColor: AppColors().purpleDefaultColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
    );
  }
}