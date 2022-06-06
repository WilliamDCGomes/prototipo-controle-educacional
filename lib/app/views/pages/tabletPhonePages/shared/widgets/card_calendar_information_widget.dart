import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../base/viewController/meeting_view_controller.dart';
import '../../../../../helpers/date_format_to_brazil.dart';
import '../../../../../helpers/format_hours.dart';
import '../../../../stylePages/app_colors.dart';
import '../../academicCalendar/controller/academic_calendar_controller.dart';

class CardCalendarInformationWidget extends StatelessWidget {
  final MeetingViewController meetingViewController;
  final AcademicCalendarController academicCalendarController = Get.find(tag: "academic-calendar-controller");

  CardCalendarInformationWidget(
  { Key? key,
    required this.meetingViewController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: SizedBox(
        height: 15.h,
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.5.h),
          ),
          elevation: 3,
          child: TextButtonWidget(
            onTap: () => academicCalendarController.openAcademicCalendarPopup(meetingViewController),
            componentPadding: EdgeInsets.zero,
            borderRadius: 2.5.h,
            widgetCustom: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
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
                              height: 3.h,
                              width: .8.h,
                              color: meetingViewController.background,
                            ),
                            Expanded(
                              child: TextWidget(
                                " ${meetingViewController.eventName}",
                                textColor: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
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
                              width: .8.h,
                            ),
                            Expanded(
                              child: TextWidget(
                                " ${DateFormatToBrazil.formatDateFull(meetingViewController.eventDay)}",
                                maxLines: 1,
                                fontSize: 16.sp,
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
                      height: 4.h,
                      width: 14.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h),
                        color: meetingViewController.background,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
                      child: Center(
                        child: TextWidget(
                          FormatHours.formatHour(
                            "${meetingViewController.from.hour}:${meetingViewController.from.minute}",
                          ),
                          maxLines: 1,
                          textColor: AppColors.whiteColor,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: meetingViewController.background,
                      size: 3.5.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}