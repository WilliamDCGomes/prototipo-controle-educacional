import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class CheckboxListTileWidget extends StatefulWidget {
  final String radioText;
  final bool checked;
  final bool? justRead;
  final Color? checkedColor;
  final Color? titleColor;
  final Icon? checkboxIcon;
  final Function(bool? value)? onChanged;

  CheckboxListTileWidget({
    Key? key,
    required this.radioText,
    this.justRead,
    this.checkedColor,
    this.titleColor,
    this.checkboxIcon,
    required this.checked,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CheckboxListTileWidget> createState() => _CheckboxListTileWidgetState();
}

class _CheckboxListTileWidgetState extends State<CheckboxListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.justRead ?? false,
      child: CheckboxListTile(
        checkColor: widget.checkedColor ?? AppColors.whiteColor,
        activeColor: AppColors.purpleDefaultColor,
        contentPadding: EdgeInsets.zero,
        secondary: widget.checkboxIcon,
        title: TextWidget(
          widget.radioText,
          textColor: widget.titleColor ?? AppColors.purpleDefaultColor,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          maxLines: 1,
          textAlign: TextAlign.start,
        ),
        value: widget.checked,
        onChanged: widget.onChanged,
      ),
    );
  }
}