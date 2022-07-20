import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../academicRecord/page/academic_record_tablet_phone_page.dart';
import '../../gradesFault/controller/grades_faults_tablet_phone_controller.dart';
import '../../mainMenu/controller/main_menu_tablet_phone_controller.dart';
import '../../../../stylePages/app_colors.dart';

class CardAcademicRecordTabletPhoneWidget extends StatelessWidget {
  final String yearValueText;
  final String semesterValueText;
  final GradesFaultsTabletPhoneController? gradesFaultsTabletPhoneController;
  final MainMenuTabletPhoneController? mainMenuTabletPhoneController;

  const CardAcademicRecordTabletPhoneWidget(
      { Key? key,
        required this.yearValueText,
        required this.semesterValueText,
        this.gradesFaultsTabletPhoneController,
        this.mainMenuTabletPhoneController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      margin: EdgeInsets.symmetric(horizontal: .5.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1.h),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.w, 4.h, 5.w, 1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButtonWidget(
                  onTap: () => mainMenuTabletPhoneController != null ?
                  mainMenuTabletPhoneController!.previousAcademicRecordCard() :
                  gradesFaultsTabletPhoneController!.previousAcademicRecordCard(),
                  height: 4.h,
                  width: 4.h,
                  componentPadding: EdgeInsets.zero,
                  widgetCustom: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColors.purpleDefaultColor,
                    size: 2.5.h,
                  ),
                ),
                TextWidget(
                  yearValueText,
                  textColor: AppColors.purpleDefaultColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.sp,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                TextButtonWidget(
                  onTap: () => mainMenuTabletPhoneController != null ?
                  mainMenuTabletPhoneController!.nextAcademicRecordCard() :
                  gradesFaultsTabletPhoneController!.nextAcademicRecordCard(),
                  height: 4.h,
                  width: 4.h,
                  componentPadding: EdgeInsets.zero,
                  widgetCustom: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: AppColors.purpleDefaultColor,
                    size: 2.5.h,
                  ),
                ),
              ],
            ),
            Center(
              child: TextWidget(
                semesterValueText,
                maxLines: 1,
                fontSize: 19.sp,
                textColor: AppColors.purpleDefaultColor,
                textAlign: TextAlign.center,
              ),
            ),
            TextButtonWidget(
              onTap: () => Get.to(() => AcademicRecordTabletPhonePage()),
              widgetCustom: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_filled,
                    size: 2.h,
                    color: AppColors.blueLinkColor,
                  ),
                  TextWidget(
                    " Ver Histórico Acadêmico",
                    maxLines: 1,
                    textColor: AppColors.blueLinkColor,
                    fontSize: 17.sp,
                    textAlign: TextAlign.center,
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