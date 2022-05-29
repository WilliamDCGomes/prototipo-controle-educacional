import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../../widgetsShared/text_widget.dart';
import '../../controller/main_menu_tablet_phone_controller.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/text_button_widget.dart';

class CardPaymentListWidget extends StatelessWidget {
  final int itemIndex;
  final String firstValue;
  final String secondValue;
  final String thirdValue;
  final Color cardColor;
  final MainMenuTabletPhoneController mainMenuTabletPhoneController;

  const CardPaymentListWidget(
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
        height: 13.h,
        width: 90.w,
        child: Card(
          color: AppColors.whiteColor,
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
                  padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: .2.h,
                          ),
                          SizedBox(
                            width: 75.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 3.h,
                                      width: .8.h,
                                      color: cardColor,
                                    ),
                                    SizedBox(
                                      width: 30.w,
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
                                SizedBox(
                                  width: 40.w,
                                  child: TextWidget(
                                    thirdValue,
                                    maxLines: 1,
                                    textColor: AppColors.greenColor,
                                    fontSize: 19.sp,
                                    textAlign: TextAlign.end,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 75.w,
                            child: RichTextTwoDifferentWidget(
                              firstText: "Vencimento:",
                              secondText: secondValue,
                              firstTextSize: 16.sp,
                              secondTextSize: 16.sp,
                              firstTextFontWeight: FontWeight.normal,
                              secondTextFontWeight: FontWeight.bold,
                              firstTextColor: AppColors.blackColor,
                              secondTextColor: AppColors.blackColor,
                              secondTextDecoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(
                            height: .2.h,
                          ),
                        ],
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