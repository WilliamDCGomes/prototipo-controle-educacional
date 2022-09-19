import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SwitchWidget extends StatelessWidget {
  final bool? justRead;
  final bool checked;
  final String? text;
  final Color? switchColor;
  final Color? textColor;
  final Function() onClicked;

  SwitchWidget({
      Key? key,
      this.justRead,
      this.text,
      required this.checked,
      this.switchColor,
      this.textColor,
      required this.onClicked,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IgnorePointer(
        ignoring: justRead ?? false,
        child: TextButtonWidget(
          onTap: () => onClicked(),
          componentPadding: EdgeInsets.zero,
          widgetCustom: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextWidget(
                  text ?? "",
                  textColor: (justRead ?? false) ? AppColors.grayTextColor : (textColor ?? AppColors.blackColor),
                  fontSize: 18.sp,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 6.h,
                height: 5.h,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Switch(
                      value: checked,
                      inactiveThumbColor: (justRead ?? false) ? AppColors.grayTextColor : AppColors.purpleDefaultColorWithOpacity,
                      activeColor: (justRead ?? false) ? AppColors.grayTextColor : (switchColor ?? AppColors.purpleDefaultColor),
                      onChanged: (bool value) {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}