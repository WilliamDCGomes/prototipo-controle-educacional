import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';

class CardMainMenuWidget extends StatelessWidget {
  final String imagePath;
  final String firstText;
  final String secondText;
  final String thirdText;
  final String? fourthText;
  final bool? showSeparator;

  const CardMainMenuWidget(
      { Key? key,
        required this.imagePath,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
        this.fourthText,
        this.showSeparator,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0),
      child: Container(
        height: 18.h,
        width: 95.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.h),
          color: AppColors.purpleDefaultColor,
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
                          textColor: AppColors.whiteColor,
                          fontSize: 18.sp,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                        ),
                      ),
                      SvgPicture.asset(
                        Paths.svgsPath + imagePath,
                        width: 4.h,
                      ),
                    ],
                  ),
                  TextWidget(
                    secondText,
                    fontWeight: FontWeight.bold,
                    maxLines: 1,
                    textColor: AppColors.whiteColor,
                    fontSize: 20.sp,
                    textAlign: TextAlign.start,
                  ),
                  Visibility(
                    visible: !(showSeparator ?? false),
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 73.w,
                            child: TextWidget(
                              thirdText,
                              maxLines: 1,
                              textColor: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: showSeparator ?? false,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                thirdText,
                                maxLines: 1,
                                textColor: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                textAlign: TextAlign.start,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Container(
                                  height: 3.h,
                                  width: .5.w,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: TextWidget(
                                  fourthText ?? "",
                                  maxLines: 1,
                                  textColor: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
      ),
    );
  }
}