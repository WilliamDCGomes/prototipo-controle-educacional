import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../../../../stylePages/app_colors.dart';
import '../../../../widgetsShared/text_button_widget.dart';
import '../../../../widgetsShared/text_widget.dart';
import '../../../academicDetails/pages/academic_details_tablet_phone_page.dart';
import '../../../academicDetails/pages/work_delivery_tablet_phone_page.dart';

class CardTabListTabletPhoneWidget extends StatelessWidget {
  final CurriculumDeliveryViewController curriculumDeliveryViewController;

  const CardTabListTabletPhoneWidget(
      { Key? key,
        required this.curriculumDeliveryViewController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0.5.h, 0, 1.h),
      child: SizedBox(
        height: 10.h,
        width: double.infinity,
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
            borderRadius: 1.h,
            componentPadding: EdgeInsets.zero,
            widgetCustom: Stack(
              children: [
                Padding(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 1.8.h,
                                  width: .5.h,
                                  color: curriculumDeliveryViewController.color,
                                ),
                                Expanded(
                                  child: TextWidget(
                                    " ${curriculumDeliveryViewController.title}",
                                    textColor: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            TextWidget(
                              curriculumDeliveryViewController.getFormattedDay,
                              maxLines: 1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              textColor: AppColors.blackColor,
                              textAlign: TextAlign.start,
                            ),
                            TextWidget(
                              curriculumDeliveryViewController.description,
                              maxLines: 1,
                              textColor: AppColors.blackColor,
                              fontSize: 14.sp,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: curriculumDeliveryViewController.color,
                        size: 3.h,
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