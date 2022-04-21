import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../helpers/paths.dart';
import '../../stylePages/appColors.dart';
import '../textWidget.dart';

class CardMainMenuWidget extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final String secondText;
  final String thirdText;

  const CardMainMenuWidget(
      { Key? key,
        required this.imagePath,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      width: 95.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.h),
        color: AppColors().purpleDefaultColor,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(2.h, .5.h, 2.h, 1.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: .5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 66.w,
                      child: TextWidget(
                        firstText,
                        textColor: AppColors().whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                      ),
                    ),
                    SvgPicture.asset(
                      Paths().svgsPath + imagePath,
                      width: 4.h,
                    ),
                  ],
                ),
                TextWidget(
                  secondText,
                  maxLines: 1,
                  textColor: AppColors().whiteColor,
                  fontSize: 18.sp,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: TextWidget(
                    thirdText,
                    maxLines: 1,
                    textColor: AppColors().whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: .5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}