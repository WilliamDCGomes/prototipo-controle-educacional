import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../../widgetsShared/text_widget.dart';
import '../../../academicDetails/pages/academic_details_tablet_phone_page.dart';
import '../../../academicDetails/pages/work_delivery_tablet_phone_page.dart';

class CardTabListWidget extends StatelessWidget {
  final CurriculumDeliveryViewController curriculumDeliveryViewController;

  const CardTabListWidget(
      { Key? key,
        required this.curriculumDeliveryViewController,
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
            borderRadius: BorderRadius.circular(1.h),
          ),
          elevation: 3,
          child: TextButtonWidget(
            onTap: () => Get.to(() => curriculumDeliveryViewController.workDelivety ?
              WorkDeliveryTabletPhonePage(
                curriculumDeliveryViewController: curriculumDeliveryViewController,
              ) :
              AcademicDetailsTabletPhonePage(
                curriculumDeliveryViewController: curriculumDeliveryViewController,
              ),
            ),
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
                                    color: curriculumDeliveryViewController.color,
                                  ),
                                  SizedBox(
                                    width: 65.w,
                                    child: TextWidget(
                                      " " + curriculumDeliveryViewController.title,
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
                                curriculumDeliveryViewController.getFormattedDay,
                                maxLines: 1,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold,
                                textColor: AppColors.blackColor,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            TextWidget(
                              curriculumDeliveryViewController.description,
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
                          color: curriculumDeliveryViewController.color,
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