import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../controllers/mainMenuTabletPhoneController.dart';
import '../../../stylePages/appColors.dart';
import '../../textButtonWidget.dart';
import '../../textWidget.dart';

class CardTabListWidget extends StatelessWidget {
  final int itemIndex;
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final Color cardColor;
  final MainMenuTabletPhoneController mainMenuTabletPhoneController;

  const CardTabListWidget(
      { Key? key,
        required this.itemIndex,
        required this.firstValue,
        required this.secondValue,
        required this.thirdValue,
        required this.cardColor,
        required this.mainMenuTabletPhoneController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(2.w, 0.5.h, 2.w, 1.h),
      child: SizedBox(
        height: 17.h,
        width: 90.w,
        child: Card(
          color: AppColors().whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.5.h),
          ),
          elevation: 3,
          child: TextButtonWidget(
            onTap: () => mainMenuTabletPhoneController.curriculumTabSelected(itemIndex),
            borderRadius: 2.5.h,
            componentPadding: EdgeInsets.all(.5.w),
            widgetCustom: Stack(
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
                      SizedBox(
                        width: 72.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 3.h,
                              width: .8.h,
                              color: cardColor,
                            ),
                            SizedBox(
                              width: 70.w,
                              child: TextWidget(
                                " " + firstValue,
                                textColor: AppColors().blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 19.sp,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextWidget(
                        secondValue,
                        maxLines: 1,
                        fontSize: 17.sp,
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
        ),
      ),
    );
  }
}