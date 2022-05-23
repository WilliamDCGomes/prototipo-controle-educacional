import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../shared/widgets/text_button_widget.dart';
import '../../../shared/widgets/text_widget.dart';

class CardTabListWidget extends StatelessWidget {
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final Color cardColor;
  final Function()? onTap;

  const CardTabListWidget(
      { Key? key,
        required this.firstValue,
        required this.secondValue,
        required this.thirdValue,
        required this.cardColor,
        this.onTap,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.w, 0.5.h, 2.w, 1.h),
      child: SizedBox(
        height: 17.h,
        width: 90.w,
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.5.h),
          ),
          elevation: 3,
          child: TextButtonWidget(
            onTap: onTap,
            borderRadius: 2.5.h,
            componentPadding: EdgeInsets.all(.5.w),
            widgetCustom: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 70.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: .2.h,
                            ),
                            SizedBox(
                              width: 66.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 3.h,
                                    width: .8.h,
                                    color: cardColor,
                                  ),
                                  SizedBox(
                                    width: 65.w,
                                    child: TextWidget(
                                      " " + firstValue,
                                      textColor: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19.sp,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 66.w,
                              child: TextWidget(
                                secondValue,
                                maxLines: 1,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.blackColor,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            TextWidget(
                              thirdValue,
                              maxLines: 1,
                              textColor: AppColors.blackColor,
                              fontSize: 17.sp,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: .2.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: cardColor,
                          size: 4.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}