import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../stylePages/appColors.dart';
import '../../textWidget.dart';

class CardTabListWidget extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final Color cardColor;

  const CardTabListWidget(
      { Key? key,
        required this.firstValue,
        required this.secondValue,
        required this.thirdValue,
        required this.cardColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 17.h,
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.h),
          color: AppColors().whiteColor,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: .2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 3.h,
                        width: .8.h,
                        color: cardColor,
                      ),
                      TextWidget(
                        " " + firstValue,
                        textColor: AppColors().blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.sp,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  TextWidget(
                    secondValue,
                    maxLines: 1,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors().blackColor,
                    textAlign: TextAlign.start,
                  ),
                  TextWidget(
                    thirdValue,
                    maxLines: 1,
                    textColor: AppColors().blackColor,
                    fontSize: 17.sp,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: .2.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}