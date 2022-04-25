import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:projeto_tcc/app/views/stylePages/appColors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PinPutWidget extends StatelessWidget {
  late final double? height;
  late final double? width;
  late final TextEditingController pinController;

  PinPutWidget(
      { Key? key,
        this.height,
        this.width,
        required this.pinController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      controller: pinController,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      length: 5,
      showCursor: true,
      defaultPinTheme: PinTheme(
        width: width ?? 65,
        height: height ?? 65,
        textStyle: TextStyle(
          fontSize: 16.sp,
          color: AppColors().purpleDefaultColor,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors().purpleDefaultColor,
            width: .25.h,
          ),
          borderRadius: BorderRadius.circular(1.h),
        ),
      ),
    );
  }
}