import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_tcc/app/utils/platform_type.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class MenuOptionsTabletPhoneWidget extends StatelessWidget {
  final String id_option;
  final String text;
  final String? imagePath;
  final int? maxLines;
  final Icon? icon;
  final double? widthButton;
  final double? textSize;
  final double? imageSize;
  final double? widthOption;
  final FontWeight? fontWeight;
  final Color? textColor;
  final List<Color>? colors;
  final Function()? onTap;

  const MenuOptionsTabletPhoneWidget(
      { Key? key,
        required this.text,
        required this.id_option,
        this.imagePath,
        this.maxLines,
        this.icon,
        this.widthButton,
        this.textSize,
        this.imageSize,
        this.widthOption,
        this.fontWeight,
        this.textColor,
        this.colors,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      width: widthOption ?? (PlatformType.isAndroid() ? 13.h : 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.h),
        color: AppColors.backgroundColor,
      ),
      child: TextButtonWidget(
        onTap: onTap,
        borderRadius: 2.5.h,
        componentPadding: EdgeInsets.symmetric(horizontal: 1.h),
        widgetCustom: SizedBox(
          height: 13.h,
          width: widthOption ?? (PlatformType.isAndroid() ? 13.h : 14.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: icon),
              Visibility(
                visible: imagePath != null && imagePath != "",
                child: Center(
                  child: SvgPicture.asset(
                    imagePath ?? "",
                    height: imageSize ?? 6.h,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: SizedBox(
                    height: 4.h,
                    child: TextWidget(
                      text,
                      textColor: textColor ?? AppColors.whiteColor,
                      fontSize: textSize ?? (
                        PlatformType.isPhone(context) ? 15.sp : 14.sp
                      ),
                      maxLines: maxLines ?? 2,
                      fontWeight: FontWeight.bold,
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