import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class CheckboxListTileWidget extends StatefulWidget {
  final String radioText;
  final bool checked;
  final bool? justRead;
  final Color? checkedColor;
  final Color? titleColor;
  final Function()? onChanged;

  CheckboxListTileWidget({
    Key? key,
    required this.radioText,
    this.justRead,
    this.checkedColor,
    this.titleColor,
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
      child: TextButtonWidget(
        componentPadding: EdgeInsets.zero,
        onTap: widget.onChanged,
        widgetCustom: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
              width: 2.h,
              child: Checkbox(
                checkColor: widget.checkedColor ?? AppColors.whiteColor,
                activeColor: AppColors.purpleDefaultColor,
                value: widget.checked,
                hoverColor: AppColors.purpleDefaultColor,
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                    width: .25.h,
                    color: AppColors.purpleDefaultColor,
                  ),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) => widget.onChanged!(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: TextWidget(
                widget.radioText,
                textColor: widget.titleColor ?? AppColors.purpleDefaultColor,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
                maxLines: 1,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}