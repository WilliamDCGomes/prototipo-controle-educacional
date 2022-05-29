import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../stylePages/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final bool? ableField;
  final bool? justRead;
  final bool? isPassword;
  final bool? enableSuggestions;
  final double? height;
  final double? width;
  final double? fontSize;
  final Widget? iconTextField;
  final Color? textColor;
  final Color? hintTextColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final MaskTextInputFormatter? maskTextInputFormatter;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final TextEditingController controller;

  const TextFieldWidget(
      { Key? key,
        this.hintText,
        this.maxLength,
        this.ableField,
        this.justRead,
        this.isPassword,
        this.enableSuggestions,
        this.height,
        this.width,
        this.fontSize,
        this.iconTextField,
        this.textColor,
        this.hintTextColor,
        this.borderColor,
        this.textStyle,
        this.textAlign,
        this.textAlignVertical,
        this.focusNode,
        this.keyboardType,
        this.decoration,
        this.maskTextInputFormatter,
        this.onTap,
        this.onEditingComplete,
        this.onChanged,
        this.onSaved,
        required this.controller,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 65,
      width: width ?? 200,
      child: TextFormField(
        obscureText: isPassword ?? false,
        maxLength: maxLength,
        enableSuggestions: enableSuggestions ?? false,
        style: textStyle ?? standardTextStyle(),
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        focusNode: focusNode,
        cursorColor: AppColors.purpleDefaultColor,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: decoration ?? standardDecoration(),
        inputFormatters: maskTextInputFormatter != null ? [maskTextInputFormatter!] : null,
        enabled: ableField ?? true,
        readOnly: justRead ?? false,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onSaved: onSaved,
        controller: controller,
      ),
    );
  }

  InputDecoration standardDecoration(){
    double heightInput = height ?? 65;
    if(height != null)
      heightInput = height!;
    return InputDecoration(
      labelText: hintText,
      labelStyle: TextStyle(
          fontSize: 16.sp,
          color: hintTextColor ?? AppColors.purpleDefaultColor,
      ),
      suffixIcon: iconTextField,
      enabledBorder: _getBorderLayout(),
      border: _getBorderLayout(),
      focusedBorder: _getBorderLayout(),
      contentPadding: EdgeInsets.only(
          bottom: heightInput / 2,  // HE
          left: 10// RE THE IMPORTANT PART
      ),
    );
  }

  TextStyle standardTextStyle(){
    return TextStyle(
      color: textColor ?? AppColors.purpleDefaultColor,
      fontSize: fontSize ?? 16.sp,
    );
  }

  OutlineInputBorder _getBorderLayout(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.purpleDefaultColor,
        width: .25.h,
      ),
    );
  }
}