import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/enums/enums.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';

class RadioListTileWidget extends StatefulWidget {
  final String radioText;
  final bool? justRead;
  final accountCancelation accountCancelationType;
  final accountCancelation? accountCancelationGroup;
  final Function(accountCancelation? value)? onChanged;

  const RadioListTileWidget({
    Key? key,
    required this.radioText,
    this.justRead,
    required this.accountCancelationType,
    required this.accountCancelationGroup,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RadioListTileWidget> createState() => _RadioListTileWidgetState();
}

class _RadioListTileWidgetState extends State<RadioListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.justRead ?? false,
      child: SizedBox(
        height: 5.h,
        child: RadioListTile<accountCancelation>(
          activeColor: AppColors.purpleDefaultColor,
          contentPadding: EdgeInsets.zero,
          title: TextWidget(
            widget.radioText,
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
          value: widget.accountCancelationType,
          groupValue: widget.accountCancelationGroup,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}