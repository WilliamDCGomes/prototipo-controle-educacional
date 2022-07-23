import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../stylePages/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final bool? ableField;
  final bool? justRead;
  final bool? isPassword;
  final bool? enableSuggestions;
  final bool? hasError;
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
  final String? Function(String?)? validator;
  final TextEditingController controller;

  TextFieldWidget(
    { Key? key,
      this.hintText,
      this.maxLength,
      this.maxLines,
      this.ableField,
      this.justRead,
      this.isPassword,
      this.enableSuggestions,
      this.hasError,
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
      this.validator,
      required this.controller,
    }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  InputDecoration standardDecoration(){
    double heightInput = widget.height ?? 65;
    if(widget.height != null) {
      heightInput = widget.height!;
    }
    return InputDecoration(
      helperText: "",
      labelText: widget.hintText,
      labelStyle: TextStyle(
        fontSize: 16.sp,
        color: widget.hasError != null && widget.hasError! ? AppColors.redColor : widget.hintTextColor ?? AppColors.purpleDefaultColor,
      ),
      suffixIcon: widget.iconTextField,
      enabledBorder: _getBorderLayout(),
      border: _getBorderLayout(),
      focusedBorder: _getBorderLayout(),
      errorBorder: _getErrorBorderLayout(),
      focusedErrorBorder: _getErrorBorderLayout(),
      contentPadding: EdgeInsets.only(
        bottom: heightInput / 2,
        left: 10,
      ),
    );
  }

  TextStyle standardTextStyle(){
    return TextStyle(
      color: widget.textColor ?? AppColors.purpleDefaultColor,
      fontSize: widget.fontSize ?? 16.sp,
    );
  }

  OutlineInputBorder _getBorderLayout(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColors.purpleDefaultColor,
        width: .25.h,
      ),
    );
  }

  OutlineInputBorder _getErrorBorderLayout(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.redColor,
        width: .25.h,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.justRead ?? false,
      child: SizedBox(
        height: widget.height ?? 65,
        width: widget.width ?? 200,
        child: TextFormField(
          validator: widget.validator,
          obscureText: widget.isPassword ?? false,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          enableSuggestions: widget.enableSuggestions ?? false,
          style: widget.textStyle ?? standardTextStyle(),
          textAlign: widget.textAlign ?? TextAlign.start,
          textAlignVertical: widget.textAlignVertical ?? TextAlignVertical.center,
          focusNode: widget.focusNode,
          cursorColor: AppColors.purpleDefaultColor,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          decoration: widget.decoration ?? standardDecoration(),
          inputFormatters: widget.maskTextInputFormatter != null ? [widget.maskTextInputFormatter!] : null,
          enabled: widget.ableField ?? true,
          onTap: widget.onTap,
          onEditingComplete: widget.onEditingComplete,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          controller: widget.controller,
        ),
      ),
    );
  }
}