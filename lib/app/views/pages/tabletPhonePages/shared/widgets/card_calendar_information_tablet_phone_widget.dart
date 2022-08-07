import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/meeting_view_controller.dart';
import '../../../../../utils/date_format_to_brazil.dart';
import '../../../../../utils/format_hours.dart';
import '../../../../stylePages/app_colors.dart';
import '../../academicCalendar/controller/academic_calendar_tablet_phone_controller.dart';

class CardCalendarInformationTabletPhoneWidget extends StatelessWidget {
  final MeetingViewController meetingViewController;
  final AcademicCalendarTabletPhoneController academicCalendarTabletPhoneController = Get.find(tag: "academic-calendar-tablet-phone-controller");

  CardCalendarInformationTabletPhoneWidget(
  { Key? key,
    required this.meetingViewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: Card(
        color: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
        elevation: 3,
        child: TextButtonWidget(
          onTap: () => academicCalendarTabletPhoneController.openAcademicCalendarPopup(meetingViewController),
          componentPadding: EdgeInsets.zero,
          borderRadius: 1.h,
          widgetCustom: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
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
                            height: 1.8.h,
                            width: .5.h,
                            color: meetingViewController.background,
                          ),
                          Expanded(
                            child: TextWidget(
                              " ${meetingViewController.eventName}",
                              textColor: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: .5.h,
                          ),
                          Expanded(
                            child: TextWidget(
                              " ${DateFormatToBrazil.formatDateFull(meetingViewController.eventDay)}",
                              maxLines: 1,
                              fontSize: 14.sp,
                              textColor: AppColors.blackColor91Percent,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: .2.h,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Container(
                    height: 3.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h),
                      color: meetingViewController.background,
                    ),
                    padding: EdgeInsets.symmetric(vertical: .2.h, horizontal: 1.w),
                    child: Center(
                      child: TextWidget(
                        FormatHours.formatHour(
                          "${meetingViewController.from.hour}:${meetingViewController.from.minute}",
                        ),
                        maxLines: 1,
                        textColor: AppColors.whiteColor,
                        fontSize: 14.sp,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: meetingViewController.background,
                  size: 3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}