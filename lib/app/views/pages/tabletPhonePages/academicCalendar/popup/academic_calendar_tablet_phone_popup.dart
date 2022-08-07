import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/meeting_view_controller.dart';
import '../../../../../utils/date_format_to_brazil.dart';
import '../../../../../utils/format_hours.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_widget.dart';

class AcademicCalendarTabletPhonePopup {
  static List<Widget> getWidgetList(
      context,
      final MeetingViewController meetingViewController,
      ){
    return [
      Center(
        child: Container(
          height: .5.h,
          width: 40.w,
          color: AppColors.grayStepColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Container(
          height: 5.h,
          decoration: BoxDecoration(
            color: AppColors.purpleDefaultColor,
            borderRadius: BorderRadius.circular(1.h),
          ),
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
          child: Center(
            child: TextWidget(
              meetingViewController.eventName,
              textColor: AppColors.whiteColor,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              maxLines: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: RichTextTwoDifferentWidget(
          firstText: "Descrição: ",
          firstTextColor: AppColors.blackColor,
          firstTextFontWeight: FontWeight.normal,
          firstTextSize: 16.sp,
          secondText: meetingViewController.eventDescription,
          secondTextColor: AppColors.blackColor,
          secondTextFontWeight: FontWeight.bold,
          secondTextSize: 16.sp,
          secondTextDecoration: TextDecoration.none,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: RichTextTwoDifferentWidget(
          firstText: "Local: ",
          firstTextColor: AppColors.blackColor,
          firstTextFontWeight: FontWeight.normal,
          firstTextSize: 16.sp,
          secondText: meetingViewController.eventPlace,
          secondTextColor: AppColors.blackColor,
          secondTextFontWeight: FontWeight.bold,
          secondTextSize: 16.sp,
          secondTextDecoration: TextDecoration.none,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: TextWidget(
          "Data:",
          textColor: AppColors.blackColor,
          fontSize: 16.sp,
          textAlign: TextAlign.start,
          maxLines: 1,
        ),
      ),
      Container(
        height: 5.h,
        color: AppColors.grayAcademicCardColor,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
        child: Center(
          child: TextWidget(
            DateFormatToBrazil.formatDateFull(meetingViewController.eventDay),
            textColor: AppColors.orangeColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: .5.h),
                  child: TextWidget(
                    "Início:",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 5.h,
                  width: 44.w,
                  color: AppColors.grayAcademicCardColor,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                  child: Center(
                    child: TextWidget(
                      FormatHours.formatHour(
                        "${meetingViewController.from.hour}:${meetingViewController.from.minute}",
                      ),
                      textColor: AppColors.purpleDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: .5.h),
                  child: TextWidget(
                    "Fim:",
                    textColor: AppColors.blackColor,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 5.h,
                  width: 44.w,
                  color: AppColors.grayAcademicCardColor,
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                  child: Center(
                    child: TextWidget(
                      FormatHours.formatHour(
                        "${meetingViewController.to.hour}:${meetingViewController.to.minute}",
                      ),
                      textColor: AppColors.purpleDefaultColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: ButtonWidget(
          hintText: "FECHAR",
          fontWeight: FontWeight.bold,
          widthButton: 75.w,
          onPressed: () => Get.back(),
        ),
      ),
    ];
  }
}