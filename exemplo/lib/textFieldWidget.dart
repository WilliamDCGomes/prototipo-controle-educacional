import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final int? maxLength;
  final bool? ableField;
  final bool? justRead;
  final bool? isPassword;
  final double? height;
  final double? width;
  final double? fontSize;
  final Widget? iconTextField;
  final Color? textColor;
  final Color? hintTextColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController controller;

  const TextFieldWidget(
      { Key? key,
        this.hintText,
        this.maxLength,
        this.ableField,
        this.justRead,
        this.isPassword,
        this.height,
        this.width,
        this.fontSize,
        this.iconTextField,
        this.textColor,
        this.hintTextColor,
        this.borderColor,
        this.textStyle,
        this.textAlignVertical,
        this.focusNode,
        this.keyboardType,
        this.decoration,
        this.onTap,
        this.onEditingComplete,
        this.onChanged,
        this.onSubmitted,
        required this.controller,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 65,
      width: width ?? 200,
      child: TextField(
        obscureText: isPassword ?? false,
        maxLength: maxLength,
        style: textStyle ?? standardTextStyle(),
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        focusNode: focusNode,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: decoration ?? standardDecoration(),
        enabled: ableField ?? true,
        readOnly: justRead ?? false,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        controller: controller,
      ),
    );
  }

  InputDecoration standardDecoration(){
    double heightInput = 65;
    if(height != null)
      heightInput = height!;
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          fontSize: 2.h,
          color: hintTextColor ?? Colors.white
      ),
      suffixIcon: iconTextField,
      enabledBorder: _getBorderLayout(),
      border: _getBorderLayout(),
      contentPadding: EdgeInsets.only(
          bottom: heightInput / 2,  // HE
          left: 10// RE THE IMPORTANT PART
      ),
    );
  }

  TextStyle standardTextStyle(){
    return TextStyle(
      color: textColor ?? Colors.white,
      fontSize: fontSize ?? 2.h,
    );
  }

  OutlineInputBorder _getBorderLayout(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor ?? Colors.white,
      ),
    );
  }
}